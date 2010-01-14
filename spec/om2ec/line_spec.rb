require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Line do
  
  before(:each) do
    @set = Line.new
    @point = Point.new
  end

  it "should return a vector when asked for normal_vector" do
    @set.normal_vector(@point)
  end
end
