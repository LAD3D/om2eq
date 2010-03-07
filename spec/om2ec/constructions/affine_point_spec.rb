require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe AffinePoint do
  
  it_should_behave_like "a free point"
  it_should_behave_like "an identified object"

  before(:each) do
    @set = AffinePoint.new
    @origin = AffinePoint.new(0,0,0)
  end

  it "should return origin by default" do
    AffinePoint.new.should == @origin
  end

  it "should accept not-targetted numbers for initialize" do
    lambda{
      AffinePoint.new(0, 5, 3)
    }.should_not raise_error
  end

  it "should create an AffinePoint correctly from numbers" do
    p = AffinePoint.new(0,5,3)
    p.x.should == "0"
    p.y.should == "5"
    p.z.should == "3"
  end

  it "should get proper coordinates from args" do
    p = AffinePoint.new(["0",:z],["2",:y],["8",:x])
    p.x.should == "8"
    p.y.should == "2"
    p.z.should == "0"
  end
end

