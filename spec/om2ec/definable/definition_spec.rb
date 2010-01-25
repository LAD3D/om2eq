require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

module Definable

  module ClassMethods
    describe Definable::ClassMethods::Definition do
      before(:each) do
        @result_class = NormalLine
        @definition = Definition.new([Plane, Point], NormalLine)
        @owner =  Class.new do
                    include Definable
                  end.new
        @definition.for_object(@owner)
      end

      it "should add an object if it is in the definition" do
        @definition.stub!(:complete?).and_return(false)
        lambda{
          @definition.add Class.new(Point).new
        }.should change{@definition.instance_variable_get("@args").size}.by(1)
      end

      it "should remove a condition if a proper object has been added" do
        @definition.stub!(:complete?).and_return(false)
        lambda{
          @definition.add Class.new(Point).new
        }.should change{@definition.instance_variable_get("@args_klazz").size}.by(-1)
      end

      it "should call :add_object if it is not complete" do
        @definition.should_receive(:add_object).twice
        add_to_definition @definition, Point, Plane
      end

      it "should be complete after adding a plane and a point" do
        add_to_definition @definition, Point, Plane
        @definition.should be_complete
      end

      it "should call complete? when adding an object" do
        @definition.should_receive(:complete?).at_least(1).and_return(false)
        @definition.add Point.new
      end

      it "should not call add_object if definition is complete" do
        @definition.should_receive(:complete?).at_least(1).and_return(true)
        @definition.should_not_receive(:add_object)
        @definition.add Point.new
      end
						
      it "should call result class' new method when completed" do
        @result_class.should_receive(:new).once
        add_to_definition @definition, Point, Plane
      end

      it "should generate an object" do
        add_to_definition @definition, Point, Plane
        @definition.generate.should_not be_nil
      end

      it "should not generate a class if it is not complete" do
        @definition.generate.should be_nil
      end

      # Methods
      def add_to_definition(definition, *classes)
       classes.each do |klazz|
         definition.add Class.new(klazz).new
       end
      end
    end
  end
end
