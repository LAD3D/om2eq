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
    end
  end

		def add_object obj
				if @definitions.map{|definition| definition.add(obj)}.any?{|x| !x.nil? }
						object_dependencies << obj
						obj.dependant_objects << self
				end
		end

		def object_dependencies
				@object_dependencies ||= []
		end

		def dependant_objects
				@dependant_object ||= []
		end

		def completed_by(definition)
				@proper_definition = definition unless @proper_definition
		end

  module ClassMethods

    def definition(args)
      arguments = args.keys.detect{|x| x.is_a?(Array) && x.all?{|y| y.is_a?(Class)}}
      target = args[arguments]
      self.add_definition(Definition.new(arguments,target))
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
