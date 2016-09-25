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
			return @arguments
		end

		def processArgument(arg)
			long = /^--([^=]+)(?:=(.*))?$/.match(arg)
			if (long)
				p(long)
			end
		end

	end

end
