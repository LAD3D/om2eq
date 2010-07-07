class PerpendicularLine

  def initialize(*args)
    line, @first_point = retrieve_args(args)
    @second_point = line.normal_vector(@first_point).apply_to(@first_point)
  end
end
