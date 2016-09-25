module Keen

	class ArgumentParser

		def self.parse(argsArray)
			parser = self.new()
			argsArray.each() do |arg|
				parser.processArgument(arg)
			end

			return parser.arguments
		end

		def initialize()
			@arguments = {}
		end

		def arguments()
			p(@arguments)
			return @arguments
		end

		def processArgument(arg)
			long = /^--([^=]+)(?:=(.*))?$/.match(arg)
			if (long)
				name = long[1]
				value = long[2]

				p(long)
				if (value == nil)
					value = true

					if (name.start_with?('no-'))
						name = name[3..-1]
						value = false
					end

					@arguments[name] = {
						:type => :option,
						:value => value,
					}
				else
					@arguments[name] = {
						:type => :optarg,
						:value => value,
					}
				end
			end
		end

	end

end
