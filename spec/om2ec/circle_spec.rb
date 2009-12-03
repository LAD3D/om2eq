require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Circle do
  
  it_should_behave_like "PointOrderedSet"
  
  before(:each) do
    @set = Circle.new
  end
end