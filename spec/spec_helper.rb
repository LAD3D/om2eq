$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'om2ec'
require 'spec'
require 'spec/autorun'

Spec::Runner.configure do |config|
  
end

shared_examples_for "PointOrderedSet" do
  
  it "should fail if key is out of bounds" do
    lambda{ @set[10000]="anything"}.should raise_error KeyOutOfBoundsError
    lambda{ @set[@set.class.instance_variable_get("@limit")]="anything"}.should raise_error KeyOutOfBoundsError
    lambda{ @set[-1]="anything"}.should raise_error KeyOutOfBoundsError
  end
  
  it "should fail if value is not a Point" do
    lambda{ @set[0]="anything"}.should raise_error ParamIsNotPointError
  end
  
  it "should not raise an error if value is a Point" do
    lambda{ @set[0]=Point.new}.should_not raise_error
    lambda{ @set[0]=Class.new(Point).new}.should_not raise_error
  end
end
