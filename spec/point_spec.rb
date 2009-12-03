require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Point do
  
  describe "#distance_to" do
    
    before(:each) do
      @first = Point.new(0,3,4)
      @second = Point.new(3.2, 4.5, 1)
      @origin = Point.new(0, 0, 0)
    end
    
    it "should return origin by default" do
      Point.new.should == @origin
    end
    
    it "should return the proper distance" do
      @first.distance_to(@origin).should == 5.0
    end
  end
end