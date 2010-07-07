class ParallelPlane < Plane

  def initialize(*args)
    plane, @point = retrieve_arguments(args)
    @normal_vector = plane.normal_vector
  end
end
