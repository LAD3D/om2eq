class VectorPoint < Point

  def initialize(vector, point)
    @applied_vector, @point = vector, point
  end

  %w{x y z}.each do |var|
    define_method var do
      "(#{@point.send(var)}+#{@applied_vector.send(var)})"
    end
  end
end
