class NormalPlane < Plane

  def initialize(*args)
    line, @point = retrieve_arguments(args)
    @normal_vector = line.vector
  end
end
