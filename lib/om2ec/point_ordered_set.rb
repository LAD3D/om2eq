module PointOrderedSet
  
  protected
  def []=(key, val)
    raise KeyOutOfBoundsError if key < 0 && key >= @limit
    raise ParamIsNotPointError unless val.is_a? Point
    @set[key] = val
  end
end

class KeyOutOfBoundsError < StandardError; end
class ParamIsNotPointError < StandardError; end