
module Keen

	class CommandAnnotationBuilder

		attr_reader(:data)

		def initialize()
			@data = {
				:args => {}
			}
		end

		def description(short, long = nil)
			@data[:desc_short] = short
			@data[:desc_long] = long || short
		end

		def option(name, banner, short = nil)
			@data[:args][name.to_sym()] = {
				:banner => banner,
				:aliases => [name]
			}
		end

	end

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
