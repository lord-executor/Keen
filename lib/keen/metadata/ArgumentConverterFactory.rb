
module Keen

	class ArgumentConverterFactory

		class << self

			@@converters = {}

			def register(valueType, converter)
				@@converters[valueType] = converter
			end

			def get(valueType)
				if (!@@converters.has_key?(valueType))
					raise ArgumentError.new("No value converter found for type '#{valueType}'")
				end

				return @@converters[valueType].new()
			end

		end

	end

end
