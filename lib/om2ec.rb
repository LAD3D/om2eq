%w{
  point_ordered_set
  circle
  line
  plane
  point
  sphere
  }.each do |file|
    require File.join('om2ec',file+'.rb')
  end