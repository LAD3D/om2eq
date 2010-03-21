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

  add_internal_method :first_point, :second_point
  
  # We're supposed to have two points.
  def normal_vector a_point
    i_point = IntersectionPoint.new()
    i_point.add_object(self)
    plane = Plane.new.add_object(a_point).add_object([self, :normal])
    i_point.add_object(plane)
    Vector.new i_point, a_point
  end

  def for(p)
    if first_point.free? && second_point.free?
      eqs_for_free_points(p)
    else
      eqs_for_non_free_points(p)
    end
  end

  def inspect
    "Line"
  end

  def vector
    @vector ||= Vector.new(first_point, second_point)
  end

  protected
  def eqs_for_non_free_points(p)
    q, r = first_point, second_point
    ["#{q.y}(#{p.x}-#{r.x})+#{q.x}(#{r.y}-#{p.y})",
     "#{q.y}(#{p.z}-#{r.z})+#{q.z}(#{r.y}-#{p.y})"]
  end

  # Explanation if there are free points then they have coordinates
  # If two coordinates are the same, then the equation is a bit different
  def eqs_for_free_points(p)
    return [] if p.free?
    q, r = first_point, second_point
    eqs = []
    uv = [:x,:y,:z] # uv stands for unused vars
    %w{x y z}.map(&:to_sym).each do |v|
      if 0 == (q.send(v).to_f - r.send(v).to_f)
        eqs << "#{p.send(v)}-#{q.send(v)}" # <-- A bit different equation
        uv.delete(v)
      end
    end
    if uv.size == 2
      eqs << "(#{p.send(uv[1])}-#{q.send(uv[1])})(#{r.send(uv[1])}-#{q.send(uv[1])})-(#{p.send(uv[1])}-#{q.send(uv[1])})(#{r.send(uv[0])}-#{q.send(uv[0])})"
    end
    eqs
  end
end
