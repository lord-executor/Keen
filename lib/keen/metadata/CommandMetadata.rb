require('keen/metadata/Option')
require('keen/metadata/OptArg')
require('keen/metadata/Positional')

module Keen

	class CommandMetadata

		attr_reader(:data)

		def initialize()
			@position = 0
			@data = {
				:args => {}
			}
		end

		def description(short, long = nil)
			@data[:desc_short] = short
			@data[:desc_long] = long || short
		end

		def option(name)
			arg = Option.new(name)
			@data[:args][arg.symbol] = arg
			return arg
		end

		def optarg(name)
			arg = OptArg.new(name)
			@data[:args][arg.symbol] = arg
			return arg
		end

		def positional()
			arg = Positional.new(@position)
			@position += 1
			@data[:args][arg.symbol] = arg
			return arg
		end

	end

end
