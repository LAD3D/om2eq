class Midpoint < SymbolicPoint

  def initialize(*args)
    @first_point, @second_point = retrieve_arguments(args)
  end
end