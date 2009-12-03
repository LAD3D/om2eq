require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Sphere do
  
  it_should_behave_like "PointOrderedSet"
  
  before(:each) do
    @set = Sphere.new
  end
end