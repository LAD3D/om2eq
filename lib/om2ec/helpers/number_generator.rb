require 'singleton'
class NumberGenerator
  include Singleton

  def initialize
    @number = 0
  end

  def succ
    @number = @number.succ
  end

  def self.succ
    instance.succ
  end
end
