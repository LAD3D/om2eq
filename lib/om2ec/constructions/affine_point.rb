class AffinePoint < Point

  attr_accessor :x, :y, :z

  def initialize(x=0, y=0, z=0)
    @x, @y, @z = x, y, z
  end

  def free?
    true
  end

  def ==(other_point)
    other_point.is_a?(AffinePoint) &&
      other_point.x == self.x &&
      other_point.y == self.y &&
      other_point.z == self.z
  end
end