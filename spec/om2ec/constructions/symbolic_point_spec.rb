require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe SymbolicPoint do
  
  it_should_behave_like "a bound point"

  before(:each) do
    @set = SymbolicPoint.new
  end
end

