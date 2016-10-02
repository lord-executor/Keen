require('keen/metadata/CommandArguments')

module Keen

	module CommandAnnotation

		@@last = nil
		@@_command_annotations = {}

		def command(metadata, &block)
			@@last = metadata

			builder = CommandArguments.new()
			block.call(builder)

			@@last = builder
		end

		def method_added(method)
			puts("defining method #{method.inspect}")
			@@_command_annotations[method] = @@last
			@@last = nil
		end

		def command_annotations()
			@@_command_annotations
		end

	end

end
