module Definable
  module ClassMethods
    class Definition

      def initialize(args, klazz, tags=[])
        @args_klazz, @result_klazz = args, klazz
        @tags = (tags.is_a?(Array)) ? tags : [tags]
        unless klazz.ancestors.include?(::Constructable)
          klazz.send :include, ::Constructable
          klazz.expected_arguments = @args_klazz
        end
        @args = []
      end

      def add(object)
        add_object(object) unless complete?
      end

      def complete?
        @args_klazz.empty?
      end

      def for_object(obj)
        @owner = obj
        self
      end

      def generate
        if complete?
          @generated ||= @result_klazz.new(*@args)
        end
      end

      class << self

        def from_args(arguments)
          args = parse_args(arguments)
          target = arguments[args]
          target.send :include, ::Constructable
          target.expected_arguments = args.dup
          self.new(args,target)
        end

        protected

        def can_be_an_arg?(arg)
          self.can_be_a_simple_arg?(arg) || self.can_be_a_tagged_arg?(arg)
        end

        def can_be_a_simple_arg?(arg)
          arg.is_a?(Class)
        end

        def can_be_a_tagged_arg?(arg)
          arg.is_a?(Array) && arg[0].is_a?(Class) && arg[1].is_a?(Symbol)
        end

        def parse_args(arguments)
          arguments.keys.detect{|x| x.is_a?(Array) && x.all?{|y| can_be_an_arg?(y)}}
        end
      end

      private

      def add_object(object)
        if @args_klazz.any? {|x| object.is_a?(x)}
          @args << object
          @args_klazz.delete_first {|x| object.is_a?(x)}
					@owner.completed_by(self) if complete?
          object
        end
      end
    end
  end
end
