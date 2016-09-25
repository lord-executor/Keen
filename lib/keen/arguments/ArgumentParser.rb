require('keen/arguments/ArgumentParseError')

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
			# EOO means "end of options"
			@eoo = false
			@position = 0
			@arguments = {}
		end

		def arguments()
			return @arguments
		end

		def processArgument(arg)
			if (arg == '--')
				@eoo = true
			elsif (!@eoo && arg.start_with?('--'))
				processLongOption(arg)
			elsif (!@eoo && arg.start_with?('-'))
				processShortOption(arg)
			else
				processPositional(arg)
			end

		end

		def processLongOption(arg)
			# matches arguments of the form "--[no-]option-name[=option value]"
			long = /^--([^=]+)(?:=(.*))?$/.match(arg)

			if (long == nil)
				raise ArgumentParseError.new("Expected long option, but found '#{arg}'")
			end

			name = long[1]
			value = long[2]

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

		def processShortOption(arg)
			# matches arguments of the form "-X[YZ]"
			short = /^-([a-zA-Z]+)$/.match(arg)

			if (short == nil)
				raise ArgumentParseError.new("Expected short option (group), but found '#{arg}'")
			end

			short[1].each_char do |c|
				@arguments[c] = {
					:type => :option,
					:value => true,
				}
			end
		end

		def processPositional(arg)
			@arguments[@position] = {
				:type => :argument,
				:value => arg,
			}
			@position += 1
		end

	end

end
