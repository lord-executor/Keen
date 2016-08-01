class ArgumentParser

	def self.parse(argsArray)
		parser = self.new()
		argsArray.each() do |arg|
			parser.processArgument(arg)
		end
	end

	def initialize()
		@arguments = {}
	end

	def processArgument(arg)
		long = /^--([^=]+)(?:=(.*))$/.match(arg)
		if (long)
			p(long)
		end
	end

end
