class NormalLine < Line

		attr_accessor :plane, :point

		def initialize(*args)
				@plane, @point =		if args[0].is_a?(Plane)
																								[args[0], args[1]]
																						else
																								[args[1], args[0]]
																						end
		end
end