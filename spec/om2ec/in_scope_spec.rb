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

  describe "#scope=" do
    it "should add self to scope" do
      s = Scope.new
      @instance.scope = s
      s.should contain(@instance)
    end
  end
end

