
module Keen

	class Argument

		TYPE_POSITIONAL = :positional
		TYPE_OPTION = :option
		TYPE_OPTIONAL = :optarg

		attr_reader(:type, :value)

		def initialize(type, value)
			@type = type
			@value = value
		end

		def push_value(value)
			# convert to array if necessary
			if (!@value.kind_of?(Array))
				@value = [@value]
			end

			@value.push(value)
		end

	end

end
