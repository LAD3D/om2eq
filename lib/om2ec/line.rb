class Line
  include Definable
  include InScope

  attr_reader :first_point, :second_point

  # Definitions
  definition [[Plane, :normal], Point] => NormalLine
  definition [[Line, :parallel], Point] => ParallelLine
  definition [[Line, :perpendicular], Point] => PerpendicularLine
  definition [Point, Point] => Segment
  definition [Plane, Plane] => IntersectionLine


  # We're supposed to have two points.
  def normal_vector a_point
    i_point = IntersectionPoint.new()
    i_point.add_object(self)
    plane = Plane.new.add_object(a_point).add_object([self, :normal])
    i_point.add_object(plane)
    Vector.new i_point, a_point
  end

  def for(p)
    puts "line #{first_point}, #{second_point}"
    q, r = first_point, second_point
    ["#{q.y}(#{p.x}-#{r.x})+#{q.x}(#{r.y}-#{p.y})",
     "#{q.y}(#{p.z}-#{r.z})+#{q.z}(#{r.y}-#{p.y})"]
  end

  def inspect
    "Line"
  end

  def vector
    @vector ||= Vector.new(first_point, second_point)
  end
end
