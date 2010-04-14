class Plane
  include Definable
  include InScope

  attr_reader :normal_vector, :point
  
  definition [[Line, :normal], Point] => NormalPlane
  definition [Point, Point, Point] => ThreePointsPlane

  add_internal_method :normal_vector, :point
  
  after_creating do |master, slave|
    slave.scope = master.scope
  end

  def for(p)
    "#{@normal_vector.x}(#{p.x}-#{@point.x})+#{@normal_vector.y}(#{p.y}-#{@point.y})+#{@normal_vector.z}(#{p.z}-#{@point.z})"
  end

  add_internal_method :for
end
