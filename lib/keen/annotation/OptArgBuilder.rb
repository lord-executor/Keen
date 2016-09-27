require('keen/arguments/ArgumentType')
require('keen/annotation/ArgumentBuilder')
require('keen/annotation/ArgumentValueType')

module Keen

	class OptArgBuilder < ArgumentBuilder

		def initialize(name, valueType = ArgumentValueType::STRING)
			super(name, ArgumentType::OPTARG)
			default(nil)
			@data[:value_type] = valueType
		end

	end

end
