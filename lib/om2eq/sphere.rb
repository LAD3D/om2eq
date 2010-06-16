class Sphere < Circle


  attr_reader :ext_p, :center
  
  include Definable
  include InScope
  
  definition [Point, [Point,:center]] => SphereByCenter

  add_internal_method :ext_p, :center
  
  after_creating do |master, slave|
    slave.scope = master.scope
  end

  # Returns r^2
  def radius2
    @radius2 ||= dist2_for ext_p, center
  end

  def for(p)
    "#{dist2_for(p, center)}-(#{radius2})"
  end

  def dist2_for(p,q)
    "(#{p.x}-#{q.x})*(#{p.x}-#{q.x})+(#{p.y}-#{q.y})*(#{p.y}-#{q.y})+(#{p.z}-#{q.z})*(#{p.z}-#{q.z})"
  end
end
