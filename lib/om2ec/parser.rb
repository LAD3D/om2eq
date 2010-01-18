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

  def parse
    get_variables
    restrict_objects
    generate_equations
  end

  def get_variables
    nodes = @xml.xpath("//descendant::xmlns:OMA/xmlns:OMS[attribute::cd='3Dgeo1']")
    @vars = {}
    nodes.each do |node|
      @vars[node.next["name"]] = @variable_types[node["name"].to_sym]
    end
  end

  def restrict_objects

  end

  def generate_equations
    
  end
end
