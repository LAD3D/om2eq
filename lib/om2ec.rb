%w{
  point_ordered_set
  circle
  line
  point
  }.each do |file|
    require File.join('om2ec',file+'.rb')
  end