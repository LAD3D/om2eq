class AffinePoint < Point

  attr_accessor :aff_x, :aff_y, :aff_z

  def initialize(x=0, y=0, z=0)
    super()
    @aff_x, @aff_y, @aff_z = x, y, z
  end

  def free?
    true
  end

  def ==(other_point)
    other_point.is_a?(AffinePoint) &&
      other_point.aff_x == self.aff_x &&
      other_point.aff_y == self.aff_y &&
      other_point.aff_z == self.aff_z
  end
end
