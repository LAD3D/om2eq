class Point

  attr_reader :variable_id

  def initialize(numbered=true)
    if numbered
      @variable_id = NumberGenerator.succ
    end
  end

  def bound?
    !free?
  end

  def free?
    false
  end

  %w{x y z}.each do |var|
    define_method var do
      instance_variable_set("@#{var}", instance_variable_get("@#{var}") || ("#{var}#{variable_id}".send((free?) ? :upcase : :downcase)))
    end

    define_method "#{var}_to" do |point|
      "(#{self.send(var)}-#{point.send(var)})"
    end
  end

  def to_vector
    @vector ||= [x, y, z]
  end

  def to(a_point)
    [x_to(a_point), y_to(a_point), z_to(a_point)]
  end

  def inspect
    to_vector.join(',')
  end
    
  include Definable
  include InScope

  definition [Point, Point] => Midpoint
  definition [[String, :x], [String, :y], [String, :z]] => AffinePoint
end
