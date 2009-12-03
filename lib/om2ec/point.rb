class Point
  
  attr_accessor :x, :y, :z
  
  def initialize(x=0,y=0,z=0)
    @x, @y, @z = x, y, z
  end
  
  def ==(other_point)
    return false unless other_point.is_a? Point
    return (x == other_point.x) && (y == other_point.y) && (z == other_point.z)
  end
  
  def distance_to(other_point)
    return Math.sqrt((x-other_point.x)**2 + (y-other_point.y)**2 + (z-other_point.z)**2)
  end
end