class Point

  attr_reader :variable_id

  def initialize(numbered=true)
				if numbered
						@variable_id = NumberGenerator.instance.succ
				end
  end

  def bound?
    !free?
  end

		def free?
				false
		end

		def x
				@x ||= "x#{variable_id}".send((free?) ? :upcase : :downcase)
		end

		def y
				@y ||= "y#{variable_id}".send((free?) ? :upcase : :downcase)
		end

		def z
				@z ||= "z#{variable_id}".send((free?) ? :upcase : :downcase)
		end

		%w{x y z}.each do |var|
				define_method "#{var}_to" do |point|
						"(#{self.send(var)}-#{point.send(var)})"
				end
		end

		def to_vector
				@vector ||= [x, y, z]
		end

		def to(a_point)
				[x_to(a_point), y_to(a_point), z_to(a_point)]
		end

		include Definable
end