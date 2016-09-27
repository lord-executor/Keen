require('keen/arguments/Argument')
require('keen/annotation/ArgumentBuilder')

module Keen

	class OptionBuilder < ArgumentBuilder

		def initialize(name)
			super(name, Argument::TYPE_OPTION)
			default(false)
		end

		def default(value)
			@data[:default] = (value == true)
			return self
		end

	end

end
