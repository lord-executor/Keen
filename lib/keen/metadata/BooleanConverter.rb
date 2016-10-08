
require('keen/metadata/ArgumentConverterFactory')

module Keen

	class BooleanConverter

		ArgumentConverterFactory::register(:boolean, BooleanConverter)

		def can_convert?(value)
			return true
		end

		def receive(value)
			if (value == nil)
				return false
			elsif (value.kind_of?(TrueClass) || value.kind_of?(FalseClass))
				return value
			elsif (value.kind_of?(String))
				return value == 'true'
			else
				return false
			end
		end

	end

end
