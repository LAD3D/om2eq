# To change this template, choose Tools | Templates
# and open the template in the editor.

class Scope

  def add name, klazz
    obj = self[name]
    if obj.nil?
      store[name.to_sym] = klazz.new
    elsif !obj.is_a?(klazz)
      raise ArgumentError, "#{name} was defined twice, first as #{obj.class} and then as #{klazz}"
    end
  end

  def [](name)
    store[name.to_sym]
  end

  protected
  def store
    @store ||= {}
  end

  def incident(node)
    first, second = self[node.next["name"]], self[node.next.next["name"]]
    first.add_object second
  end

  def is_midpoint(node)
    self[node.next["name"]].add_object self[node.next.next["name"]]
    self[node.next["name"]].add_object self[node.next["name"]]
  end

  def circle_center(node)

  end

  def sphere_center(node)

  end

  def perpendicular(node)

  end

  def line_parallel(node)

  end

  def plane_parallel(node)

  end

  def normal(node)

  end

  def are_on_line(node)

  end

  def are_on_plane(node)
    
  end
end
