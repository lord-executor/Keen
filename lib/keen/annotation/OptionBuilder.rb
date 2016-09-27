require('keen/arguments/ArgumentType')
require('keen/annotation/ArgumentBuilder')

module Keen

	class OptionBuilder < ArgumentBuilder

		def initialize(name)
			super(name, ArgumentType::OPTION)
			default(false)
		end

		def default(value)
			@data[:default] = (value == true)
			return self
		end

	end

end
