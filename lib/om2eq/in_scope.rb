module InScope

  def scope
    @scope
  end

  def scope=(scope)
    @scope = scope
    @scope.auxiliar << self unless @scope.nil? || @scope.contains?(self)
  end
end
