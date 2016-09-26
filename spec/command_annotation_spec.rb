require 'spec_helper'
require 'keen/annotation/CommandAnnotation'

describe Keen::ArgumentParser do

	class Dummy

		extend Keen::CommandAnnotation

		command({
			:bla => 'gurray'
		})
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
