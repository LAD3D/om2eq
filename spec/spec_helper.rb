$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'om2ec'
require 'spec'
require 'spec/autorun'

Spec::Runner.configure do |config|
  
end

shared_examples_for "a bound point" do
  
  it "should be bound" do
    @set.should be_bound
  end
  
  it "should not be free" do
    @set.should_not be_free
  end
end

shared_examples_for "a free point" do

  it "should not be bound" do
    @set.should_not be_bound
  end

  it "should be free" do
    @set.should be_free
  end
end
