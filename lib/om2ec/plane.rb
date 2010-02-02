class Plane
  include Definable

  definition [[Line, :normal], Point] => NormalPlane
  definition [Point, Point, Point] => ThreePointsPlane
end
