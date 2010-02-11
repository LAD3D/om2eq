require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Parser do
  before(:each) do
    @parser = Parser.new(ASSETS_DIR.intersection_point)
  end

  it "should generete only one scope" do
    scope = Scope.new
    Scope.should_receive(:new).once.and_return(scope)
    @parser.parse!
  end

  it "should call get_variables, restrict_objects and generate_equations when parsing" do
    [:get_variables, :restrict_objects].each do |m|
      @parser.should_receive(m).once
    end
    @parser.parse!
  end

  describe "#get_variables" do

    it "should get a point in intersection point example" do
      @parser.get_variables
      @parser.scope[:A].should be_a(Point)
    end
  end

  describe "#points" do

    before(:each) do
      @parser.parse!
    end

    it "should call Scope#points method" do
      @parser.scope.should_receive(:points).and_return([])
      @parser.points
    end

    it "should be a String" do
      @parser.points.should be_a(String)
    end

    it "should be cached" do
      @parser.scope.should_receive(:points).once.and_return([])
      @parser.points
      @parser.points
    end
  end

  describe "#equations" do

    before(:each) do
      @parser.parse!
    end

    it "should call Scope#equations method" do
      @parser.scope.should_receive(:equations).and_return([])
      @parser.equations
    end

    it "should be a String" do
      @parser.equations.should be_a(String)
    end

    it "should be cached" do
      @parser.scope.should_receive(:equations).once.and_return([])
      @parser.equations
      @parser.equations
    end
  end
end

