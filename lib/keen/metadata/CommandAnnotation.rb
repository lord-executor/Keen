require('keen/metadata/CommandArguments')

module Keen

	module CommandAnnotation

		@@_last_block = nil
		@@_annotation_blocks = {}

		def command(&block)
			@@_last_block = block
		end

		def method_added(method)
			puts("defining method #{method.inspect}")
			@@_annotation_blocks[method] = @@_last_block
		end

		def get_args(method)
			builder = CommandArguments.new()
			@@_annotation_blocks[method].call(builder)

			return builder
		end

	end

end
