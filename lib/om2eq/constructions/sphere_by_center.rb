class SphereByCenter < Sphere

  def initialize(*args)
    @ext_p, @center = retrieve_arguments(args)
  end
end
