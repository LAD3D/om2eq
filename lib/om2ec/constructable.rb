module Constructable

  def self.included(base)
    base.extend ClassMethods
  end

  def retrieve_arguments(arguments)
    if retrieve_test(arguments)
      args = arguments.dup
      expected_arguments.map{|klazz| args.delete_first{|x| x.is_a?(klazz)}}
    else
      raise ArgumentError, "#{self.class} expects #{expected_arguments.join(', ')}, found #{arguments.map(&:class).join(', ')}"
    end
  end

  def retrieve_test(args)
    expected = expected_arguments.dup
    args.map(&:class).each{|x| expected.delete_first{|y| x.ancestors.include?(y)}}
    expected.empty? && args.size == expected_arguments.size
  end

  protected
  def expected_arguments
    self.class.expected_arguments
  end

  module ClassMethods
    def expected_arguments
      @expected_arguments
    end

    def expected_arguments=(args)
      @expected_arguments = args
    end
  end
end
