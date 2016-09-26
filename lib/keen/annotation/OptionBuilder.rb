
module Keen

	class OptionBuilder

		attr_reader(:data)

		def initialize(name)
			@data = {
				:aliases => [name],
				:default => false
			}
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
