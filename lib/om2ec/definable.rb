module Definable

  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods

    def definition(args)
      a = args.key.detect{|x| x.is_a? Array && x.all?{|y| y.is_a? Class}}
      b = args[a]
      self.add_definition(Definition.new(a,b))
    end
  end
end
