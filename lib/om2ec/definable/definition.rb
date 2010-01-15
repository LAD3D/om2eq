module Definable
  module ClassMethods
    class Definition

      def initialize(args, klazz)
        @args_klazz, @result_klazz = args, klazz
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
