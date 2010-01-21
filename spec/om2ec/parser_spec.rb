require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Parser do
  before(:each) do
    @parser = Parser.new(ASSETS_DIR.intersection_point)
  end

  it "should generete only one scope" do
    scope = Scope.new
    Scope.should_receive(:new).once.and_return(scope)
    @parser.parse
  end

  it "should call get_variables, restrict_objects and generate_equations when parsing" do
    [:get_variables, :restrict_objects, :generate_equations].each do |m|
      @parser.should_receive(m).once
    end
    @parser.parse
  end

  describe "#get_variables" do

    it "should get a point in intersection point example" do
      @parser.get_variables
      @parser.scope[:A].should be_a(Point)
    end
  end
end

