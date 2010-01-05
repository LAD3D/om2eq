require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Definable do
  before(:each) do
    @class = Class.new
    @class.send :include, Definable
    @class.definition [Point, Point] => Midpoint
				@class.definition [Point, Line] => Line
    @definable = @class.new
    [@class, @definable].each do |var|
      def var.definitions
        self.instance_variable_get("@definitions")
      end
    end
  end

  it "should extend Definable::ClassMethods when including Definable" do
    (class << @class; self; end).should include(Definable::ClassMethods)
  end

  it "should have an independent set of definitions" do
    @definable.definitions.should_not be_nil
    @definable.definitions.should_not be_equal(@class.definitions)
  end

  it "should alias add_object method if it exists" do
    obj = Class.new do
            def add_object(obj)
              obj
            end

            include Definable
          end.new
    obj.should be_respond_to(:add_object_not_definable)
  end

  it "should call add in all definitions" do
    point = Point.new
    @definable.definitions.each{|d| d.should_receive(:add).with(point)}
    @definable.add_object point
  end

		it "should call completed_by when one definition gets complete" do
				@definable.should_receive(:completed_by).with(@definable.definitions[0])
				@definable.add_object Point.new
				@definable.add_object AffinePoint.new(0,10,20)
		end

		it "should add added object to dependencies if it is added" do
				point = Point.new
				@definable.add_object point
				@definable.object_dependencies.should include(point)
				point.dependant_objects.should include(@definable)
		end

		it "should not add added object to dependencies if it is not added" do
				obj = Class.new.new
				@definable.add_object obj
				@definable.object_dependencies.should_not include(obj)
				lambda{obj.dependant_objects}.should raise_error
		end
end

