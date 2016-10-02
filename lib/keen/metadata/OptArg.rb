require('keen/arguments/ArgumentType')
require('keen/metadata/Argument')

module Keen

	class OptArg < Argument

		def initialize(name, valueType = ArgumentValueType::STRING)
			super(name, ArgumentType::OPTARG, valueType)
			default(nil)
		end

	end

end
