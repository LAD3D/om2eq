class AffinePoint < Point

  attr_accessor :aff_x, :aff_y, :aff_z

  def initialize(*args)
    super()
    args = [["0",:x], ["0",:y], ["0",:z]] if args.empty?
    @aff_x, @aff_y, @aff_z = if args.size == 3 && args.all?{|a| a.is_a?(Numeric)}
                               args.map &:to_s
                             else
                               retrieve_arguments(args)
                             end
  end

  def free?
    true
  end

  %w{x y z}.each do |var|

    define_method "#{var}" do
      instance_variable_get("@aff_#{var}")
    end
  end
  
  def ==(other_point)
    other_point.is_a?(AffinePoint) &&
      other_point.aff_x == self.aff_x &&
      other_point.aff_y == self.aff_y &&
      other_point.aff_z == self.aff_z
  end
end
