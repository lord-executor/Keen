require 'spec_helper'
require 'keen/metadata/CommandAnnotation'
require 'keen/task/TaskInvoker'

describe Keen::CommandAnnotation do

	class Dummy

		extend Keen::CommandAnnotation

		command { |b|
			b.description('Executes demo command')
			b.option('demo-option')
				.banner('controls demo mode')
				.default(true)
				.alias('d')
			b.optarg('opt-arg', :decimal)
				.banner('optional argument')
				.default(42)
			b.positional('name')
				.banner('positional argument')
		}
		def demo(args)
			p('Executing demo command...')
			p(args)
			p('... DONE')
		end

	end

	it 'adds metadata to methods' do
		args = Dummy::get_args(:demo)

		expect(args.respond_to?(:demo_option)).to be true
		expect(args.demo_option).to be true
		expect(args.respond_to?(:opt_arg)).to be true
		expect(args.opt_arg).to be 42
		expect(args.respond_to?(:name)).to be true
		expect(args.name).to be nil

		args.opt_arg = '6six6'
		expect(args.opt_arg).to be 6.0

		Keen::TaskInvoker::invoke(Dummy, :demo, ['--no-demo-option', '--opt-arg=55', 'gurray'])
	end

end
