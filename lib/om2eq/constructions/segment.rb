# As a proper segment has no sense and is not used in 3DGeo
# I redefine it as a Line going defined by two points.
class Segment < Line

  def initialize(*args)
    @first_point, @second_point = retrieve_arguments(args)
  end
end