class ThreePointsPlane < Plane
  def initialize(*args)
    @point, p2, p3 = retrieve_arguments(args)
    v1, v2 = Vector.new(@point,p2), Vector.new(@point, p3)
    @normal_vector = v1.cross_product(v2)
  end
end
