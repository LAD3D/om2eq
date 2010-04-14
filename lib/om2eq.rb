require 'rubygems'
require 'nokogiri'


ROOT_DIR = File.join(File.dirname(__FILE__), 'om2eq')
VENDOR_DIR=File.join(File.dirname(__FILE__),'..','vendor')
CONSTRUCTIONS_DIR = File.join(ROOT_DIR, 'constructions')
DEFINABLE_DIR = File.join(ROOT_DIR, 'definable')
HELPERS_DIR = File.join(ROOT_DIR, 'helpers')

# Load definable
DEFINABLE_LIB_DIR =File.join(VENDOR_DIR, 'definable', 'lib')
if File.exist?(File.join(DEFINABLE_LIB_DIR, 'definable.rb'))
  require File.join(DEFINABLE_LIB_DIR, 'definable.rb')
else
  begin
    require 'definable'
  rescue
    puts "You really need definable installed for this to work."
  end
end

autoload :InScope, File.join(ROOT_DIR, 'in_scope.rb')
autoload :Line, File.join(ROOT_DIR, 'line.rb')
autoload :Parser, File.join(ROOT_DIR, 'parser.rb')
autoload :Plane, File.join(ROOT_DIR, 'plane.rb')
autoload :Point, File.join(ROOT_DIR, 'point.rb')
autoload :Scope, File.join(ROOT_DIR, 'scope.rb')

require File.join(HELPERS_DIR, 'array.rb')
autoload :NumberGenerator, File.join(HELPERS_DIR, 'number_generator.rb')

autoload :SymbolicPoint, File.join(CONSTRUCTIONS_DIR, 'symbolic_point.rb')
autoload :AffinePoint, File.join(CONSTRUCTIONS_DIR, 'affine_point.rb')
autoload :Circle, File.join(CONSTRUCTIONS_DIR, 'circle.rb')
autoload :Configuration, File.join(CONSTRUCTIONS_DIR, 'configuration.rb')
autoload :EndPoints, File.join(CONSTRUCTIONS_DIR, 'end_points.rb')
autoload :IntersectionLine, File.join(CONSTRUCTIONS_DIR, 'intersection_line.rb')
autoload :IntersectionPoint, File.join(CONSTRUCTIONS_DIR, 'intersection_point.rb')
autoload :Midpoint, File.join(CONSTRUCTIONS_DIR, 'midpoint.rb')
autoload :NormalLine, File.join(CONSTRUCTIONS_DIR, 'normal_line.rb')
autoload :NormalPlane, File.join(CONSTRUCTIONS_DIR, 'normal_plane.rb')
autoload :ParallelLine, File.join(CONSTRUCTIONS_DIR, 'parallel_line.rb')
autoload :ParallelPlane, File.join(CONSTRUCTIONS_DIR, 'parallel_plane.rb')
autoload :PerpendicularLine, File.join(CONSTRUCTIONS_DIR, 'perpendicular_line.rb')
autoload :PointOnLine, File.join(CONSTRUCTIONS_DIR, 'point_on_line.rb')
autoload :Segment, File.join(CONSTRUCTIONS_DIR, 'segment.rb')
autoload :Sphere, File.join(CONSTRUCTIONS_DIR, 'sphere.rb')
autoload :ThreePointsPlane, File.join(CONSTRUCTIONS_DIR, 'three_points_plane.rb')
autoload :Vector, File.join(CONSTRUCTIONS_DIR, 'vector.rb')
autoload :VectorPoint, File.join(CONSTRUCTIONS_DIR, 'vector_point.rb')

Point
Line
Plane
