# -*- coding: utf-8 -*-
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

  def add_point_to(*objs)
    p = PointOn.new
    incidences[p] = []
    objs.each do |o|
      p.add_object o
      incidences[p] << o
    end
    p
  end

  def add_restriction rest
    restrictions << rest
  end

  def restrictions
    @restrictions ||= []
  end
  
  def auxiliar
    @auxiliar ||= []
  end

  def equations
    eqs = []
    incidences.each_pair do |point, cons|
      cons.each{|x| eqs << x.for(point)}
    end
    eqs.flatten | restrictions
  end

  def set_affine_coordinates(node)
    p = self[node.next['name']]
    coordinates = node.next.next.children[1..3].map{|n| n['dec']}
    p.add_object [coordinates[0], :x]
    p.add_object [coordinates[1], :y]
    p.add_object [coordinates[2], :z]
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
    # Not done.
  end

  def sphere_center(node)
    p, s = self[node.next['name']], self[node.next.next['name']]
    p, s = s, p if p.is_a? Sphere
    raise Error, 'I need a point' unless p.is_a? Point
    raise Error, 'I need a sphere' unless s.is_a? Sphere
    s.add_object [p, :center]
  end

  def perpendicular(node)

  end

  def line_parallel(node)
    l1, l2 = self[node.next['name']], self[node.next.next['name']]
    l1.add_object [l2, :parallel]
    l2.add_object [l1, :parallel]
  end

  def plane_parallel(node)

  end

  def normal(node)
    f, s = self[node.next['name']], self[node.next.next['name']]
    f, s = s, f unless f.is_a?(Line)
    unless f.is_a? Line
      raise ArgumentError("Neither #{node.next['name']} nor #{node.next.next['name']} are a line. A line and a plane are needed for normal construction")
    end
    unless s.is_a? Plane
      raise ArgumentError("Neither #{node.next['name']} nor #{node.next.next['name']} are a plane. A line and a plane are needed for normal construction")
    end

    s.add_object [f, :normal]
  end

  def are_on_line(node)
    # Create a line.
    line = Line.new
    line.add_object self[node.next['name']]
    line.add_object self[node.next.next['name']]
    line.scope = self

    # The rest of the points should be incident on it.
    cur = node.next.next.next
    while !cur.nil?
      (incidences[self[cur['name']]] ||= []) << line
      cur = cur.next
    end
  end

  def are_on_plane(node)
    cur = node.next

    # Create a Plane
    plane = Plane.new
    plane.add_object self[cur['name']]; cur = cur.next
    plane.add_object self[cur['name']]; cur = cur.next
    plane.add_object self[cur['name']]; cur = cur.next
    plane.scope = self

    # The rest of the points should be incident on it.
    while !cur.nil?
      (incidences[self[cur['name']]] ||= []) << plane
      cur = cur.next
    end
  end
end
