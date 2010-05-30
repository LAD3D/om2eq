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

  after_creating do |master, slave|
    slave.scope = master.scope
  end
  
  # We're supposed to have two points.
  def normal_vector a_point
    i_point = Point.new()
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
    [eq_for_coordinates(p, :x, :y),
     eq_for_coordinates(p, :z, :y)]
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
        eqs << p.send(v.to_s+"_to", q)  # <-- A bit different equation
        uv.delete(v)
      end
    end
    if uv.size == 3
      eq_for_non_free_points(p) # The equations are the same as the
                                # non-free-points options
    elsif uv.size == 2
      eqs << eq_for_coordinates(p, *uv)
    end
    eqs
  end

  # p => Point
  # s => first coordinate (x, y or z)
  # t => second coordinate (x, y or z)
  def eq_for_coordinates(p, s, t)
    q, r = first_point, second_point
    s, t = s.to_s+"_to", t.to_s + "_to"
    p.send(t,q)+r.send(s,q)+"-"+p.send(s,q)+r.send(t,q)
  end
end
