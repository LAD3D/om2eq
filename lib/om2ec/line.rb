class Line
  include Definable

  attr_reader :first_point, :second_point

  # Definitions
  definition [Plane, Point] => NormalLine, :tag => :normal
  definition [Line, Point] => ParallelLine, :tag => :parallel
  definition [Point, Point] => Segment
  definition [Plane, Plane] => IntersectionLine


  # We're supposed to have two points.
  def normal_vector a_point
    i_point = IntersectionPoint.new()
    i_point.add_object(self)
    i_point.add_object(Plane.new.add_object(a_point).add_object(self))
    i_point.to(a_point)
  end

  def vector
    @vector ||= [first_point.x_to(second_point),first_point.y_to(second_point),first_point.z_to(second_point)]
  end
end
