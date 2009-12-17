class Array
  def delete_first(obj = nil, &block)
    if block
      self.delete_at(self.index(&block))
    else
      self.delete_at(self.index(obj))
    end
  end
end
