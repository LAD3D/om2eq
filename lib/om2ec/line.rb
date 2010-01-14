class Line
  include Definable

  # We're supposed to have two points.
  def normal_vector a_point
    i_point = IntersectionPoint.new(false)
    i_point.add_object(self)
    i_point.add_object(Plane.new.add_object(a_point).add_object(self))
    i_point.to(a_point)
  end

  def vector
    @vector ||= [first_point.x_to(second_point),first_point.y_to(second_point),first_point.z_to(second_point)]
  end
end
