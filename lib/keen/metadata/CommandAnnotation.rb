require('keen/metadata/CommandMetadata')

module Keen

	module CommandAnnotation

		@@last = nil
		@@_command_annotations = {}

		def command(metadata, &block)
			@@last = metadata

			builder = CommandMetadata.new()
			block.call(builder)

			@@last = builder.data
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
