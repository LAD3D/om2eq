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

    class Definition

      def initialize(args, klazz)
        @args_klazz, @result_klazz = args, klazz
        @args = []
      end

      def add(object)
        if @args_klazz.include? object.class
          @args << object
          @args_klazz.delete_first object.class
          object
        else
          nil
        end
      end
    end
  end
end
