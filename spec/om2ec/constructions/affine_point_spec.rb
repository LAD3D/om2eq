require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe AffinePoint do
  
  it_should_behave_like "a free point"
  it_should_behave_like "an identified object"

  before(:each) do
    @set = AffinePoint.new
    @origin = AffinePoint.new(0, 0, 0)
  end

  it "should return origin by default" do
    AffinePoint.new.should == @origin
  end
end

