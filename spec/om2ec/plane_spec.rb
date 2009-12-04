require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Plane do
  it_should_behave_like "PointOrderedSet"
  
  before(:each) do
    @set = Plane.new
  end
end