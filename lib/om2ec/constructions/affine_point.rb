class AffinePoint < Point

  attr_accessor :x, :y, :z

  def initialize(x=0, y=0, z=0)
    @x, @y, @z = x, y, z
  end
end