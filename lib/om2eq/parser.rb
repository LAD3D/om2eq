class Parser
  def initialize(file)
    @xml = Nokogiri::XML(File.new(file), nil, nil, Nokogiri::XML::ParseOptions::NOBLANKS)
    @variable_types = {:point => Point,
       :line => Line,
       :segment => Segment,
       :endpoints => EndPoints,
       :midpoint => Midpoint,
       :plane => Plane,
       :circle => Circle,
       :sphere => Sphere
       }
  end

  def parse!
    get_variables
    restrict_objects
    self
  end

  def get_affine_coordinates()
    nodes = @xml.xpath("//descendant::xmlns:OMA/xmlns:OMS[attribute::name='set_affine_coordinates']")
    nodes.each do |node|
      scope.set_affine_coordinates(node)
    end
  end


  # All variable names are declared after a OMS node containing
  # one type declared in 3Dgeo1. node contains the node whose name
  # attribute is the type. node.next's name attr is the variable name.
  def get_variables
    nodes = @xml.xpath("//descendant::xmlns:OMA/xmlns:OMS[attribute::cd='3Dgeo1']")
    nodes.each do |node|
      scope.add(node.next["name"], @variable_types[node["name"].to_sym])
    end
  end

  # All restrictions are declared in 3Dgeo2. node's name is the type of
  # restriction. For each restriction, a method in scope is declared. These
  # methods receive the OMS[attribute::cd='3Dgeo2'] node
  def restrict_objects
    get_affine_coordinates
    nodes = @xml.xpath("//descendant::xmlns:OMA/xmlns:OMS[attribute::cd='3Dgeo2']")
    nodes.each do |node|
      scope.send node["name"].to_sym, node
    end
  end

  def equations
    @equations ||= scope.equations.join("\n")
  end

  def points
    @points ||= scope.points.map{|p| p.inspect}.join(',') #TODO Change to an appropriate repr.
  end

  def scope
    @scope ||= Scope.new
  end
end
