class Plane
  include Definable
  include InScope

  definition [[Line, :normal], Point] => NormalPlane
  definition [Point, Point, Point] => ThreePointsPlane

  after_creating do |master, slave|
    slave.scope = master.scope
  end
  
end
