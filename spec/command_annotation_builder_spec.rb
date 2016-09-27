require 'spec_helper'
require 'keen/annotation/CommandAnnotationBuilder'
require 'keen/annotation/OptionBuilder'

describe Keen::CommandAnnotationBuilder do

	it 'creates an empty metadata set' do
		builder = Keen::CommandAnnotationBuilder.new()

		expect(builder.data).to be_a_kind_of(Hash)
		expect(builder.data).to eq({ :args => {} })
	end

	it 'can add a command description' do
		builder = Keen::CommandAnnotationBuilder.new()
		builder.description('short', 'long')

		expect(builder.data[:desc_short]).to eq 'short'
		expect(builder.data[:desc_long]).to eq 'long'
	end

	it 'can add an option' do
		builder = Keen::CommandAnnotationBuilder.new()
		builder.option('test-option')

		expect(builder.data[:args]).to_not be_empty
		expect(builder.data[:args]['test-option'.to_sym()]).to be_a_kind_of(Hash)
	end

	describe Keen::OptionBuilder do

		it 'creates a default option' do
			builder = Keen::CommandAnnotationBuilder.new()
			builder.option('test-option')
			option = builder.data[:args]['test-option'.to_sym()]

			expect(option[:type]).to be :option
			expect(option[:aliases]).to eq ['test-option']
			expect(option[:default]).to be false
		end

	end

end
