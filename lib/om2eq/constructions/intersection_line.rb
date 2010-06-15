# -*- coding: undecided -*-
class IntersectionLine

  def initialize(*args)
    @pl1, @pl2 = retrieve_arguments(args)
  end

  def first_point
    work_out_points unless @first_point
    @first_point
  end

  def second_point
    work_out_points unless @second_point
    @second_point
  end

  protected
  def work_out_points
    @first_point  = scope.add_point_to @pl1, @pl2
    @second_point = scope.add_point_to @pl1, @pl2
    scope.add_restriction "(#{@first_point.x}-#{@second_point.x})*(#{@first_point.x}-#{@second_point.x})+(#{@first_point.y}-#{@second_point.y})*(#{@first_point.y}-#{@second_point.y})+(#{@first_point.z}-#{@second_point.z})*(#{@first_point.z}-#{@second_point.z})-1"
  end
end
