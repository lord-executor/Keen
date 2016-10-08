require('spec_helper')
require('keen/metadata/CommandArguments')
require('keen/metadata/Option')
require('keen/metadata/OptArg')
require('keen/metadata/Positional')
require('keen/arguments/ArgumentType')

describe Keen::CommandArguments do

	it 'creates an empty metadata set' do
		builder = Keen::CommandArguments.new()

		expect(builder.data).to be_a_kind_of(Hash)
		expect(builder.data).to eq({ :args => {} })
	end

	it 'can add a command description' do
		builder = Keen::CommandArguments.new()
		builder.description('short', 'long')

		expect(builder.data[:desc_short]).to eq 'short'
		expect(builder.data[:desc_long]).to eq 'long'
	end

	it 'can add an option' do
		builder = Keen::CommandArguments.new()
		builder.option('test-option')

		expect(builder.data[:args]).to_not be_empty
		expect(builder.data[:args][:test_option]).to be_a_kind_of(Keen::Option)
	end


	describe Keen::Option do

		it 'creates a default option' do
			builder = Keen::CommandArguments.new()
			builder.option('test-option')
			option = builder.data[:args][:test_option]

			expect(option.type).to be Keen::ArgumentType::OPTION
			expect(option.getAliases()).to eq ['test-option']
			expect(option.getDefault()).to be false
		end

		it 'can set a banner' do
			builder = Keen::CommandArguments.new()
			builder.option('test-option').banner('banner')
			option = builder.data[:args][:test_option]

			expect(option.getBanner()).to eq 'banner'
		end

		it 'can set a description' do
			builder = Keen::CommandArguments.new()
			builder.option('test-option').description('description')
			option = builder.data[:args][:test_option]

			expect(option.getDescription()).to eq 'description'
		end

		it 'can set a default value' do
			builder = Keen::CommandArguments.new()
			builder.option('test-option').default(true)
			option = builder.data[:args][:test_option]

			expect(option.getDefault()).to be true
		end

		it 'can set add an alias' do
			builder = Keen::CommandArguments.new()
			builder.option('test-option').alias('t')
			option = builder.data[:args][:test_option]

			expect(option.getAliases).to eq ['test-option', 't']
		end

	end


	describe Keen::OptArg do

		it 'creates a default optarg' do
			builder = Keen::CommandArguments.new()
			builder.optarg('test-optarg')
			option = builder.data[:args][:test_optarg]

			expect(option.type).to be Keen::ArgumentType::OPTARG
			expect(option.getAliases()).to eq ['test-optarg']
			expect(option.getDefault()).to be nil
		end

	end

	describe Keen::Positional do

		it 'creates a default positional' do
			builder = Keen::CommandArguments.new()
			builder.positional('test-positional')
			option = builder.data[:args][:test_positional]

			expect(option.type).to be Keen::ArgumentType::POSITIONAL
			expect(option.getDefault()).to be nil
		end

	end

end
