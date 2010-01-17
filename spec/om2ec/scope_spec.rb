require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Scope do
  before(:each) do
    @scope = Scope.new
  end

  it "should add a proper object with its name" do
    klazz = Class.new
    @scope.add(:P, klazz)
    @scope["P"].should be_a(klazz)
  end

  it "should fail if defining same variable with different class" do
    @scope.add(:P, Point)
    lambda{
      @scope.add(:P, Line)
    }.should raise_error
  end
end

