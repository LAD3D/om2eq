module Definable

  def self.included(base)
    base.extend ClassMethods
    base.instance_eval do
      alias_method :initialize_without_definition, :initialize

      define_method :initialize do
        initialize_without_definition
         @definitions = self.class.definitions
      end
    end
  end

  module ClassMethods

    def definition(args)
      a = args.key.detect{|x| x.is_a? Array && x.all?{|y| y.is_a? Class}}
      b = args[a]
      self.add_definition(Definition.new(a,b))
    end

    def add_definition(definition)
      self.instance_eval do
        @definitions ||= []
        @definitions << definition
      end
    end

    def definitions
      @definitions ||= []
      @definitions.dup
    end
  end
end
