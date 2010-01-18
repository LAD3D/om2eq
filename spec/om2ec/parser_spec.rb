require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Parser do
  before(:each) do
    @parser = Parser.new(ASSETS_DIR.intersection_point)
  end

  it "should call get_variables when parsing" do
    @parser.should_receive(:get_variables).once
    @parser.parse
  end

  it "should call restrict_objects when parsing" do
    @parser.should_receive(:restrict_objects).once
    @parser.parse
  end

  it "should call generate_equations when parsing" do
    @parser.should_receive(:generate_equations).once
    @parser.parse
  end

  describe "#get_variables" do

    it "should get a point in intersection point example" do
      @parser.parse
      @parser.instance_variable_get("@vars")["A"].should == Point
    end
  end
end

