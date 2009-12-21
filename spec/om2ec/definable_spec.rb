require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Definable do
  before(:each) do
    @class = Class.new
    @class.send :include, Definable
    @definable = @class.new
    [@class, @definable].each do |var|
      def var.definitions
        self.instance_variable_get("@definitions")
      end
    end
  end

  it "should extend Definable::ClassMethods when including Definable" do
    (class << @class; self; end).should include(Definable::ClassMethods)
  end

  it "should have an independent set of definitions" do
    @definable.definitions.should_not be_nil
    @definable.definitions.should_not be_equal(@class.definitions)
  end
end

