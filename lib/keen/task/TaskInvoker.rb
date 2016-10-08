
module Keen

	module TaskInvoker

		def self.invoke(clazz, command, args)

			obj = clazz.new()
			if (!obj.respond_to?(command))
				raise Error.new("Task class #{clazz} does not contain a command '#{command}'")
			end

			parsedArgs = Keen::ArgumentParser.parse(args)
			meta = clazz::command_annotations()[command]

			meta.arguments.each() do |key, arg|
				arg.getAliases().each() do |argAlias|
					if (parsedArgs.has_key?(argAlias))
						arg.value = parsedArgs[argAlias].value
					end
				end
			end

			obj.send(command, meta)
		end

	end

end
