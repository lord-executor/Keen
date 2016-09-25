require 'spec_helper'
require 'keen/arguments/ArgumentParser'

describe Keen::ArgumentParser do

	it 'can parse long options' do
		args = Keen::ArgumentParser.parse(['--option'])

		expect(args.has_key?('option')).to be true
		expect(args['option'][:type]).to be :option
		expect(args['option'][:value]).to be true
	end

	it 'can parse negated long options' do
		args = Keen::ArgumentParser.parse(['--no-option'])

		expect(args.has_key?('option')).to be true
		expect(args['option'][:type]).to be :option
		expect(args['option'][:value]).to be false
	end

	it 'can parse short options' do
		args = Keen::ArgumentParser.parse(['-o'])

		expect(args.has_key?('o')).to be true
		expect(args['o'][:type]).to be :option
		expect(args['o'][:value]).to be true
	end

	it 'can parse multiple grouped short options' do
		args = Keen::ArgumentParser.parse(['-opq'])

		expect(args.has_key?('o')).to be true
		expect(args['o'][:type]).to be :option
		expect(args['o'][:value]).to be true

		expect(args.has_key?('p')).to be true
		expect(args['p'][:type]).to be :option
		expect(args['p'][:value]).to be true

		expect(args.has_key?('q')).to be true
		expect(args['q'][:type]).to be :option
		expect(args['q'][:value]).to be true
	end

	it 'can parse optional argument' do
		args = Keen::ArgumentParser.parse(['--opt-arg=Hello World'])

		expect(args.has_key?('opt-arg')).to be true
		expect(args['opt-arg'][:type]).to be :optarg
		expect(args['opt-arg'][:value]).to be 'Hello World'
	end

	it 'can parse positional arguments' do
		args = Keen::ArgumentParser.parse(['first', 'second'])

		expect(args.has_key?(0)).to be true
		expect(args[0][:type]).to be :argument
		expect(args[0][:value]).to be 'first'

		expect(args.has_key?(1)).to be true
		expect(args[1][:type]).to be :argument
		expect(args[1][:value]).to be 'first'
	end

	it 'can parse positional arguments after EOO (end of options)' do
		args = Keen::ArgumentParser.parse(['--', '--first', '-second'])

		expect(args.has_key?(0)).to be true
		expect(args[0][:type]).to be :argument
		expect(args[0][:value]).to be '--first'

		expect(args.has_key?(1)).to be true
		expect(args[1][:type]).to be :argument
		expect(args[1][:value]).to be '-first'
	end

end
