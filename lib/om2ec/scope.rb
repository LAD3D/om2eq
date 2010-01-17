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
end
