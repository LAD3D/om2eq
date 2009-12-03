module PointOrderedSet
  
  def []=(key, val)
    raise KeyOutOfBoundsError if key < 0 || key >= self.class.instance_variable_get("@limit")
    raise ParamIsNotPointError unless val.is_a? Point
    @set[key] = val
  end
end

class KeyOutOfBoundsError < StandardError; end
class ParamIsNotPointError < StandardError; end