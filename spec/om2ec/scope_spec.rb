require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Scope do
  before(:each) do
    @scope = Scope.new
  end

  it "should add a proper object with its name" do
    klazz = Class.new
    klazz2 = Class.new
    @scope.add(:P, klazz)
    @scope.add(:Q, klazz2)
    @scope["P"].should be_a(klazz)
    @scope["Q"].should be_a(klazz2)
  end

  it "should add itself as scope" do
    klazz = Class.new
    @scope.add(:P, klazz)
    @scope["P"].scope.should == @scope
  end

  it "should include InScope module to the class if it does not include it yet" do
    klazz = Class.new
    lambda{
      @scope.add(:P, klazz)
    }.should_not raise_error
  end

  it "should fail if defining same variable with different class" do
    @scope.add(:P, Point)
    lambda{
      @scope.add(:P, Line)
    }.should raise_error
  end

  describe "#points"do

    it "should take the points from both auxiliar and store" do
      obj1 = Class.new.new
      obj2 = Class.new.new
      obj3 = Class.new.new
      p1 = Class.new(Point).new
      p2 = Class.new(Point).new
      store = @scope.send(:store)
      store["P"] = p1; store["l"] = obj2; store["m"] = obj3
      @scope.auxiliar << obj1; @scope.auxiliar << p2
      points = @scope.points
      points.should include(p1)
      points.should include(p2)
      points.should_not include(obj1)
      points.should_not include(obj2)
      points.should_not include(obj3)
    end
  end

  describe "#contains?" do

    it "should check both auxiliar and store" do
      obj1 = Class.new.new
      obj2 = Class.new.new
      @scope.send(:store)[:P] = obj1
      @scope.auxiliar << obj2
      @scope.should contain(obj1)
      @scope.should contain(obj2)
    end
  end
end

