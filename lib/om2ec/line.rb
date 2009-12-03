class Line
  include PointOrderedSet
  
  def initialize
    @limit = 2
    @set = []
  end
  
  def first_point
    @set[0]
  end
  
  def first_point=(value)
    self[0]=value
  end
  
  def second_point
    @set[1]
  end
  
  def second_point=(value)
    self[1]=value
  end
end