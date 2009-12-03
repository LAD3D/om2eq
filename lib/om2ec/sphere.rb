class Sphere
  
  include PointOrderedSet
  
  @limit=2
  
  def initialize
    @set=[]
  end
  
  def sphere_center
    @set[0]
  end
  
  def sphere_center=(other_point)
    self[0]=other_point
  end
  
  def external_point
    @set[1]
  end
  
  def external_point=(other_point)
    self[1]=other_point
  end
end