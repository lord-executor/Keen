
require('keen/metadata/ArgumentConverterFactory')

module Keen

	class StringConverter

		ArgumentConverterFactory.register(:string, StringConverter)

		def can_convert?(value)
			return true
		end

		def receive(value)
			if (value == nil || !value.kind_of?(String))
				return ''
			else
				return value
			end
		end

	end

end
