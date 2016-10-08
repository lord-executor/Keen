require('keen/arguments/ArgumentType')
require('keen/metadata/Argument')

module Keen

	class OptArg < Argument

		def initialize(name, valueType = :string)
			super(name, ArgumentType::OPTARG, valueType)
			default(nil)
		end

	end

end
