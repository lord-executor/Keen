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
			@eoo = false
			@position = 0
			@arguments = {}
		end

		def arguments()
			p(@arguments)
			return @arguments
		end

		def processArgument(arg)
			long = /^--([^=]+)(?:=(.*))?$/.match(arg)

			if (arg == '--')
				@eoo = true
				return
			end

			if (!@eoo && long)
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
			else
				short = /^-([a-zA-Z]+)$/.match(arg)
				if (!@eoo && short)
					short[1].each_char do |c|
						@arguments[c] = {
							:type => :option,
							:value => true,
						}
					end
				else
					@arguments[@position] = {
						:type => :argument,
						:value => arg,
					}
					@position = @position + 1
				end
			end
		end

	end

end
