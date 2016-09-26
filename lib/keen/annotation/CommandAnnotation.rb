require('keen/annotation/CommandAnnotationBuilder')

module Keen

	module CommandAnnotation

		@@last = nil
		@@_command_annotations = {}

		def command(metadata, &block)
			@@last = metadata

			builder = CommandAnnotationBuilder.new()
			block.call(builder)

			@@last = builder.data
		end

		def method_added(method)
			puts("defining method #{method.inspect}")
			@@_command_annotations[method] = @@last
			p(@@last)
			@@last = 42
		end

		def command_annotations()
			@@_command_annotations
		end

	end

end
