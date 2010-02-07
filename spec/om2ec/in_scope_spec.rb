require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe InScope do
  before(:each) do
    @klazz =  Class.new do
                include InScope
              end
    @instance = @klazz.new
  end

  it "should respond to methods scope and scope=" do
    @instance.should respond_to(:scope)
    @instance.should respond_to(:scope=)
  end
end

