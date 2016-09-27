require('keen/arguments/Argument')

module Keen

	class OptionBuilder

		def initialize(name)
			@data = {
				:type => Argument::TYPE_OPTION,
				:aliases => [name],
				:default => false
			}
		end

		def data
			return @data.clone()
		end

		def banner(banner)
			@data[:banner] = banner
			return self
		end

		def description(desc)
			@data[:desc] = desc
			return self
		end

		def default(value)
			@data[:default] = (value == true)
			return self
		end

		def alias(name)
			@data[:aliases].push(name)
			return self
		end

	end

end
