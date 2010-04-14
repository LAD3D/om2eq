class ParallelLine < Line

  def initialize(*args)
    line, @first_point = retrieve_arguments(args)
    @second_point = line.vector.apply_to(@first_point)
  end
end
