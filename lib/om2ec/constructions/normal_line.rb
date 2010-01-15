class NormalLine < Line

  attr_accessor :plane, :point

  def initialize(*args)
    @plane, @point =		retrieve_arguments(args)
  end
end