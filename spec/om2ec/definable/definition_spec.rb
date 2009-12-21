require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

module Definable

  module ClassMethods
    describe Definition do
      before(:each) do
        @definition = Definition.new([Plane, Point], NormalLine)
      end

      it "should add an object if it is in the definition" do
        @definition.stub!(:complete?).and_return(false)
        lambda{
          @definition.add Point.new
        }.should change{@definition.instance_variable_get("@args").size}.by(1)
      end

      it "should remove a condition if a proper object has been added" do
        @definition.stub!(:complete?).and_return(false)
        lambda{
          @definition.add Point.new
        }.should change{@definition.instance_variable_get("@args_klazz").size}.by(-1)
      end

      it "should call complete? when adding an object" do
        @definition.should_receive(:complete?).and_return(false)
        @definition.add Point.new
      end

      it "should not call add_object if definition is complete" do
        @definition.should_receive(:complete?).and_return(true)
        @definition.should_not_receive(:add_object)
        @definition.add Point.new
      end
    end
  end
end

