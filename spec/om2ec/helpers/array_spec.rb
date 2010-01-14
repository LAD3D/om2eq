require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Array do
  before(:each) do
    @array = Array.new
  end

  describe "#delete_first" do
    
    before(:each) do
      @array = [1, 2, 2, 3, 4]
    end
    
    it "should delete only the first occurrence when object given" do
      @array.delete_first 2
      @array.should == [1, 2, 3, 4]
    end

    it "should delete only the first occurence when block given" do
      @array.delete_first {|x| x > 1}
      @array.should == [1, 2, 3, 4]
    end

    it "should not raise an error if object is not in the array" do
      lambda{
        @array.delete_first("esto no está")
      }.should_not raise_error
    end

    it "should not raise an error if block is never true" do
      lambda{
        @array.delete_first{|x| false}
      }.should_not raise_error
    end
  end
end

