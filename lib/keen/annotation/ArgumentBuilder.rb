require('keen/arguments/Argument')

module Keen

	class ArgumentBuilder

		def initialize(name, type)
			@data = {
				:type => type,
				:aliases => [name],
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
			@data[:default] = value
			return self
		end

		def alias(name)
			@data[:aliases].push(name)
			return self
		end

	end

end
