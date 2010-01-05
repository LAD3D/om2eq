class Point

  attr_reader :variable_id

  def initialize
    @variable_id = NumberGenerator.instance.succ
  end

  def bound?
    !free?
  end

		include Definable
end