require 'spec_helper'
require 'keen/metadata/CommandAnnotation'

describe Keen::CommandAnnotation do

	class Dummy

		extend Keen::CommandAnnotation

		command({ :bla => 'gurray' }) { |b|
			b.description('Executes demo command')
			b.option('demo-option')
				.banner('controls demo mode')
				.default(true)
				.alias('d')
		}
		def demo(args)
		end

	end

	it 'adds metadata to methods' do
		annotations = Dummy::command_annotations()

		expect(annotations).not_to be_empty
		expect(annotations.has_key?(:demo)).to be true
		p(annotations[:demo])
	end

end
