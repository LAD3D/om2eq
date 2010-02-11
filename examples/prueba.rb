require 'lib/om2ec.rb'

ROOT_DIR=File.join(File.dirname(__FILE__), '..')

p = Parser.new(File.join(ROOT_DIR,'spec','assets','intersection_point.xml'))
p.parse!
puts "Equations"
puts p.equations
puts "Points"
puts p.points
