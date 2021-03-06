require('keen/arguments/ArgumentType')
require('keen/metadata/ArgumentConverterFactory')
require('keen/metadata/StringConverter')
require('keen/metadata/DecimalConverter')
require('keen/metadata/BooleanConverter')

module Keen

	class Argument

		attr_reader(:data, :symbol)

		def initialize(name, type, valueType = :string)
			@data = {
				:type => type,
				:aliases => [name],
				:vtype => valueType,
			}

			@converter = ArgumentConverterFactory::get(valueType)

			if (name.kind_of?(String))
				@symbol = name.gsub(/[^0-9A-Za-z]/, '_').to_sym()
			end
		end

		def type()
			return @data[:type]
		end

		def valueType()
			return @data[:vtype]
		end

		def value()
			return @value || getDefault()
		end

		def value=(v)
			@value = @converter.receive(v)
		end

		def getBanner()
			return @data[:banner]
		end

		def banner(banner)
			@data[:banner] = banner
			return self
		end

		def getDescription()
			return @data[:desc]
		end

		def description(desc)
			@data[:desc] = desc
			return self
		end

		def getDefault()
			@data[:default]
		end

		def default(value)
			@data[:default] = value
			return self
		end

		def getAliases()
			return @data[:aliases]
		end

		def alias(name)
			@data[:aliases].push(name)
			return self
		end

	end

end
