# Scope cambio con métodos.

class Scope

  def add name, klazz
    obj = self[name]
    if obj.nil?
      klazz.send :include, InScope unless klazz.include?(InScope)
      inst = klazz.new
      inst.scope = self
      store[name.to_sym] = inst
    elsif !obj.is_a?(klazz)
      raise ArgumentError, "#{name} was defined twice, first as #{obj.class} and then as #{klazz}"
    end
  end

  def [](name)
    store[name.to_sym]
  end

  def points
    (auxiliar.select{|obj| obj.is_a?(Point)} | store.values.select{|obj| obj.is_a?(Point)}).sort do |a,b|
      a.variable_id <=> b.variable_id
    end
  end

  def contains?(value)
    auxiliar.include?(value) || store.value?(value)
  end

  def auxiliar
    @auxiliar ||= []
  end

  def equations
    eqs = []
    incidences.each_pair do |point, cons|
      cons.each{|x| eqs << x.for(point)}
    end
    eqs
  end

  protected
  def store
    @store ||= {}
  end

  def incidences
    @incidences ||= {}
  end

  def incident(node)
    first, second = self[node.next["name"]], self[node.next.next["name"]]
    first.add_object second
    if first.is_a?(Point)
      (incidences[first] ||= []) << second
    elsif second.is_a?(Point)
      (incidences[second] ||= []) << first
    end
  end

  def is_midpoint(node)
    self[node.next["name"]].add_object self[node.next.next["name"]]
    self[node.next["name"]].add_object self[node.next.next.next["name"]]
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
