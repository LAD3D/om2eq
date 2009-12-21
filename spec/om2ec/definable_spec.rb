require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Definable do
  before(:each) do
    @class = Class.new
    @class.send :include, Definable
    @class.definition [Point, Point] => Midpoint
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
end

