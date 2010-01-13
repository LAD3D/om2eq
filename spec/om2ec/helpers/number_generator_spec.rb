require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe NumberGenerator do
  before(:each) do
    @number_generator = NumberGenerator.instance
  end

  it "should be a singleton class" do
    NumberGenerator.instance.should be_equal(@number_generator)
  end

  it "should call instance method when class method is called" do
    @number_generator.should_receive(:succ)
    NumberGenerator.succ
  end
end

