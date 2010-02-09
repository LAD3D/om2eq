$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'om2ec'
require 'spec'
require 'spec/autorun'

ASSETS_DIR = File.join(File.dirname(__FILE__), 'assets')

class << ASSETS_DIR
  Dir.glob(File.join(ASSETS_DIR, '**', '*.xml')).each do |file|
     define_method file.gsub(ASSETS_DIR+File::SEPARATOR, '').gsub(File::SEPARATOR, '_').gsub('.xml', '') do
       file
     end
  end
end

Spec::Runner.configure do |config|
  
end

Spec::Matchers.define :contain do |value|
  match do |container|
    container.respond_to?(:contains?) && container.contains?(value)
  end

  failure_message_for_should do |container|
    "expected #{container} to contain value #{value}"
  end

  failure_message_for_should_not do |container|
    "expected #{container} not to contain value #{value}"
  end

  description do
    "expect a container of #{value}"
  end
end

shared_examples_for "a bound point" do
  
  it "should be bound" do
    @set.should be_bound
  end
  
  it "should not be free" do
    @set.should_not be_free
  end
end

shared_examples_for "a free point" do

  it "should not be bound" do
    @set.should_not be_bound
  end

  it "should be free" do
    @set.should be_free
  end
end

shared_examples_for "an identified object" do

  it "should have an id" do
    @set.variable_id.should_not be_nil
  end
end

class Object
  def vector?
    self.is_a?(Array) && self.size == 3
  end
end

class String
  def upcased?
    self == upcase
  end

  def downcased?
    self == downcase
  end
end
