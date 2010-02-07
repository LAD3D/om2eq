class Plane
  include Definable
  include InScope

  definition [[Line, :normal], Point] => NormalPlane
  definition [Point, Point, Point] => ThreePointsPlane
end
