class ParallelPlane < Plane

  def initialize(*args)
    line, @first_point = retrieve_arguments(args)
    @normal_vector
  end
end
