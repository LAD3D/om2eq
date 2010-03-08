class Midpoint < SymbolicPoint

  def initialize(*args)
    @first_point, @second_point = retrieve_arguments(args)
  end

  def x
    @x ||= "((#{@first_point.x}-#{@second_point.x})/2)"
  end

  def y
    @y ||= "((#{@first_point.y}-#{@second_point.y})/2)"
  end

  def z
    @z ||= "((#{@first_point.z}-#{@second_point.z})/2)"
  end
end
