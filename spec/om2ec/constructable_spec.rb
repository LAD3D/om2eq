require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Constructable do
  before(:each) do
    @class =  Class.new do
                include Constructable
              end
    @class.expected_arguments = [String, Fixnum]
    @fail_args = ["hola", "adios"]
    @win_args = [2, "dos"]
    @instance = @class.new
  end

  after(:each) do
    @class.expected_arguments.should == [String, Fixnum]
    @fail_args.should == ["hola", "adios"]
    @win_args.should == [2, "dos"]
  end

  describe "#retrieve_arguments" do

    it "should make the class extend Constructable::ClassMethods" do
      klazz = Class.new
      klazz.should_receive(:extend).with(Constructable::ClassMethods)
      klazz.send :include, Constructable
    end

    it "should raise an error if retrieve_test fails" do
      @instance.should_receive(:retrieve_test).and_return(false)
      lambda{
        @instance.retrieve_arguments([String, String]) #Parameters are not important due to the stub above
      }.should raise_error(ArgumentError)
    end

    it "should not raise an error if retrieve_test does not fail" do
      @instance.should_receive(:retrieve_test).and_return(true)
      lambda{
        @instance.retrieve_arguments([String, String]) #Parameters are not important due to the stub above
      }.should_not raise_error(ArgumentError)
    end

    it "should return the arguments in the correct order" do
      string, fixnum = @instance.retrieve_arguments(@win_args)
      string.should == @win_args[1]
      fixnum.should == @win_args[0]
    end
  end

  describe "#retrieve_test" do

    # Not proud of this spec
    it "should fail when passed wrong arguments" do
      @instance.retrieve_test(@fail_args).should == false
    end

    # Not proud of this spec either
    it "should fail when passed wrong arguments" do
      @instance.retrieve_test(@win_args).should == true
    end

    it "should pass even with subclasses" do
      klazz1, klazz2 = Class.new, Class.new
      @class.expected_arguments = [klazz2, klazz1]
      @instance.retrieve_test([klazz1.new, klazz2.new]).should == true
      @class.expected_arguments = [String, Fixnum]
    end
  end
end

