class ParallelLine < Line

  def initialize(*args)
    @point, @line = retrieve_arguments(args)
  end
end