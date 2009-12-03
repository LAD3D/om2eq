module PointOrderedSet
  
  def []=(key, val)
    raise KeyOutOfBoundsError if key < 0 || key >= self.class.limit
    raise ParamIsNotPointError unless val.is_a? Point
    @set[key] = val
  end
  
  def self.included(base)
    base.extend(ClassMethods)
  end
  
  module ClassMethods
    def limit
      @limit
    end
  end
end

class KeyOutOfBoundsError < StandardError; end
class ParamIsNotPointError < StandardError; end