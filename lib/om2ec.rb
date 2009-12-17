%w{
  number_generator
  array
  }.each do |file|
    require File.join('om2ec','helpers', file+'.rb')
  end

require File.join('om2ec', 'definable', 'definition.rb')

%w{
  definable
  line
  plane
  point
  }.each do |file|
    require File.join('om2ec',file+'.rb')
  end

%w{
  symbolic_point
  affine_point
  circle
  configuration
  intersection_point
  midpoint
  normal_line
  normal_plane
  parallel_line
  parallel_plane
  perpendicular_line
  point_on_line
  segment
  sphere
  }.each do |file|
    require File.join('om2ec', 'constructions', file+'.rb')
  end