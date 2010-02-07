class Vector

  def initialize(*args)
    @first_point, @second_point =  args
  end

  include InScope
end

#TODO
#(x1-x2)x+(y1-y2)y+(z1-z2)z