module Definable

  def self.included(base)
    base.extend ClassMethods
    base.instance_eval do
      alias_method :initialize_without_definition, :initialize
      alias_method :add_object_not_definable, :add_object if method_defined? :add_object

      define_method :initialize do
        initialize_without_definition
        @definitions = self.class.definitions(self)
      end

      define_method :add_object do |obj|
        @definitions.each{|definition| definition.add(obj)}
      end
    end
  end

		def completed_by(definition)
				@proper_definition = definition unless @proper_definition
		end

  module ClassMethods

    def definition(args)
      a = args.keys.detect{|x| x.is_a?(Array) && x.all?{|y| y.is_a?(Class)}}
      b = args[a]
      self.add_definition(Definition.new(a,b))
    end

    def add_definition(definition)
      self.instance_eval do
        @definitions ||= []
        @definitions << definition
      end
    end

    def definitions(obj)
      @definitions ||= []
      @definitions.dup.each {|d| d.for_object(obj)}
    end
  end
end
