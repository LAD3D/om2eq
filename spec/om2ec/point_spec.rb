require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Point do

  before(:each) do
    @point = Point.new
  end

  it "should create a point with a variable_id" do
    @point.instance_variable_get(:@variable_id).should_not be_nil
  end

  it "should create a point without a variable_id" do
    NumberGenerator.instance.should_not_receive(:succ)
    Point.new(false).instance_variable_get(:@variable_id).should be_nil
  end

  it "should have upcased variable names if free" do
    @point.should_receive(:free?).at_least(3).and_return(true)
    @point.to_vector.each {|c| c.should be_upcased}
  end

  it "should have downcased variable names if not free" do
    @point.should_receive(:free?).at_least(3).and_return(false)
    @point.to_vector.each {|c| c.should be_downcased}
  end

  it "should call each component when calling vector" do
    @point.should_receive(:x)
    @point.should_receive(:y)
    @point.should_receive(:z)
    @point.to_vector
  end

  it "should not call each component when calling vector twice" do
    @point.should_receive(:x).once
    @point.should_receive(:y).once
    @point.should_receive(:z).once
    @point.to_vector
    @point.to_vector
  end


  %w{x y z}.map(&:to_sym).each do |var|
    it "should call free only once when calling #{var} twice" do
      @point.should_receive(:free?).once
      @point.send var
      @point.send var
    end

    describe "##{var}_to" do

      before(:each) do
	@another_point = Point.new
      end

      it "should match each component" do
	res = @point.send("#{var}_to", @another_point)
	res.should match(@point.send("#{var}"))
	res.should match(@another_point.send("#{var}"))
      end
    end
  end
end
