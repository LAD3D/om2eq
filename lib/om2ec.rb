%w{
  point
  point_ordered_set
  line
  }.each do |file|
    require File.join('om2ec',file+'.rb')
  end