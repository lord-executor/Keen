require('keen/arguments/ArgumentType')
require('keen/metadata/Argument')

module Keen

	class Positional < Argument

		attr_reader(:position)
		
		def initialize(name, index, valueType = ArgumentValueType::STRING)
			super(name, ArgumentType::POSITIONAL, valueType)
			default(nil)
			@position = index
		end

	end

end
