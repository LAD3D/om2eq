# NormalLine represents the normal line of a plane going through
# a point.
class NormalLine < Line

  def initialize(*args)
    plane, @first_point = retrieve_arguments(args)
  end
end