class Midpoint < SymbolicPoint

  def initialize(*args)
    raise ArgumentError, "Midpoint needs two points" unless args.all?{|x| x.is_a?(Point)}
    @first_point, @second_point = args
  end
end