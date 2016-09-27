require('keen/annotation/OptionBuilder')

module Keen

	class CommandAnnotationBuilder

		def initialize()
			@data = {
				:args => {}
			}
		end

		def data
			result = @data.clone

			result[:args].each() do |key, value|
				result[:args][key] = (value.kind_of?(OptionBuilder) ? value.data : value)
			end

			return result
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
