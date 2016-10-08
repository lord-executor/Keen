
require('keen/metadata/ArgumentConverterFactory')

module Keen

	class DecimalConverter

		ArgumentConverterFactory::register(:decimal, DecimalConverter)

		def can_convert?(value)
			return true
		end

		def receive(value)
			if (value == nil)
				return Float(0)
			elsif (value.kind_of?(Float))
				return value
			elsif (value.kind_of?(String))
				return value.to_f()
			else
				return Float(0)
			end
		end

	end

end
