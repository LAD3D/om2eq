ROOT_DIR = File.join(File.dirname(__FILE__), 'om2ec')
CONSTRUCTIONS_DIR = File.join(ROOT_DIR, 'constructions')
DEFINABLE_DIR = File.join(ROOT_DIR, 'definable')
HELPERS_DIR = File.join(ROOT_DIR, 'helpers')

autoload :Constructable, File.join(ROOT_DIR, 'constructable.rb')
autoload :Definable, File.join(ROOT_DIR, 'definable.rb')
autoload :Line, File.join(ROOT_DIR, 'line.rb')
autoload :Plane, File.join(ROOT_DIR, 'plane.rb')
autoload :Point, File.join(ROOT_DIR, 'point.rb')

require File.join(HELPERS_DIR, 'array.rb')
autoload :NumberGenerator, File.join(HELPERS_DIR, 'number_generator.rb')
module Definable
  module ClassMethods
    autoload :Definition, File.join(DEFINABLE_DIR, 'definition.rb')
  end
end

autoload :SymbolicPoint, File.join(CONSTRUCTIONS_DIR, 'symbolic_point.rb')
autoload :AffinePoint, File.join(CONSTRUCTIONS_DIR, 'affine_point.rb')
autoload :Circle, File.join(CONSTRUCTIONS_DIR, 'circle.rb')
autoload :Configuration, File.join(CONSTRUCTIONS_DIR, 'configuration.rb')
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
