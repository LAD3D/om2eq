class Circle
  
  include PointOrderedSet
  
  def initialize
    @limit=2
    @set=[]
  end
  
  def circle_center
    @set[0]
  end
  
  def circle_center=(other_point)
    self[0]=other_point
  end
  
  def external_point
    @set[1]
  end
  
  def external_point=(other_point)
    self[1]=other_point
  end
end