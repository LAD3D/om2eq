class Vector

  def initialize(*args)
    @first_point, @second_point =  args
  end

  def apply_to(point)
    VectorPoint.new(self, point)
  end

  %w{x y z}.each do |var|
    define_method var do
      "(#{@first_point.send(var)}-#{@second_point.send(var)})"
    end
  end

  def cross_product(v)
    CrossProductVector.new(self,v)
  end

  def to_a
    @_arr ||= [x,y,z]
  end
  
  include InScope
end

#TODO
#(x1-x2)x+(y1-y2)y+(z1-z2)z
