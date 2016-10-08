require('keen/arguments/ArgumentType')
require('keen/metadata/Argument')

module Keen

	class Option < Argument

		def initialize(name)
			super(name, ArgumentType::OPTION, :boolean)
			default(false)
		end

		def default(value)
			@data[:default] = (value == true)
			return self
		end

	end

end
