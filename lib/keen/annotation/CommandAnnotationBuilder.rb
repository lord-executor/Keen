require('keen/annotation/OptionBuilder')

module Keen

	class CommandAnnotationBuilder

		attr_reader(:data)

		def initialize()
			@data = {
				:args => {}
			}
		end

		def description(short, long = nil)
			@data[:desc_short] = short
			@data[:desc_long] = long || short
		end

		def option(name)
			@data[:args][name.to_sym()] = OptionBuilder.new(name)
			return @data[:args][name.to_sym()]
		end

	end

end
