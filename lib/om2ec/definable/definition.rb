module Definable
  module ClassMethods
    class Definition

      def initialize(args, klazz)
        @args_klazz, @result_klazz = args, klazz
        @args = []
      end

      def add(object)
        unless complete?
          if @args_klazz.include? object.class
            @args << object
            @args_klazz.delete_first object.class
            object
          end
        end
      end

      def complete?
        @args_klazz.empty?
      end
    end
  end
end
