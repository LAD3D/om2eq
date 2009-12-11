require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Point do
  
  before(:each) do
    @origin = Point.new(0, 0, 0)
  end
    
  it "should return origin by default" do
    Point.new.should == @origin
  end
end