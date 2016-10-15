require('keen/arguments/ArgumentParser')
require('keen/arguments/ArgumentType')

module Keen

	module TaskInvoker

		def self.invoke(clazz, command, args)

			obj = clazz.new()
			if (!obj.respond_to?(command))
				raise ArgumentError.new("Task class #{clazz} does not contain a command '#{command}'")
			end

			parsedArgs = Keen::ArgumentParser.parse(args)
			meta = clazz::get_args(command)

			meta.arguments.each() do |key, arg|
				matched = false

				if (arg.type == ArgumentType::POSITIONAL)
					if (parsedArgs.has_key?(arg.position))
						matched = true
						arg.value = parsedArgs[arg.position].value
					end
				else
					# options and opt-args are not required
					matched = true

					arg.getAliases().each() do |argAlias|
						if (parsedArgs.has_key?(argAlias))
							arg.value = parsedArgs[argAlias].value
						end
					end
				end

				if (!matched)
					raise ArgumentError.new("Unmatched required argument '#{arg.symbol}'")
				end

			end

			return obj.send(command, meta)
		end

	end

end
