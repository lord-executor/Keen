require('keen/arguments/ArgumentType')
require('keen/metadata/Argument')

module Keen

	class Positional < Argument

		def initialize(index, valueType = ArgumentValueType::STRING)
			super(index, ArgumentType::POSITIONAL, valueType)
			@symbol = index
			default(nil)
		end

	end

end
