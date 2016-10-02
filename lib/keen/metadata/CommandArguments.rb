require('keen/metadata/Option')
require('keen/metadata/OptArg')
require('keen/metadata/Positional')

module Keen

	class CommandArguments

		attr_reader(:data)

		def initialize()
			@position = 0
			@data = {
				:args => {}
			}
		end

		def defineArgumentAccess(arg)
			@data[:args][arg.symbol] = arg

			define_singleton_method(arg.symbol) do
				return @data[:args][arg.symbol].value
			end

			define_singleton_method((arg.symbol.to_s() + '=').to_sym()) do |v|
				@data[:args][arg.symbol].value = v
			end

			return arg
		end

		def description(short, long = nil)
			@data[:desc_short] = short
			@data[:desc_long] = long || short
		end

		def option(name)
			arg = Option.new(name)
			return defineArgumentAccess(arg)
		end

		def optarg(name)
			arg = OptArg.new(name)
			return defineArgumentAccess(arg)
		end

		def positional(name)
			arg = Positional.new(name, @position)
			@position += 1
			
			return defineArgumentAccess(arg)
		end

	end

end
