class CrossProductVector < Vector

  def initialize(v1, v2)
    @first_vector, @second_vector = v1, v2
  end

  def x
    "(#{a[1]}#{b[2]}-#{a[2]}#{b[1]})"
  end

  def y
    "(#{a[2]}#{b[0]}-#{a[0]}#{b[2]})"
  end

  def z
    "(#{a[0]}#{b[1]}-#{a[1]}#{b[0]})"
  end

  private
  def a
    @first_vector.to_a
  end

  def b
    @second_vector.to_a
  end
end
