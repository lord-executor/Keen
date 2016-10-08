require 'spec_helper'
require 'keen/metadata/CommandAnnotation'
require 'keen/task/TaskInvoker'

describe Keen::CommandAnnotation do

	class Dummy

		extend Keen::CommandAnnotation

		command({ :bla => 'gurray' }) { |b|
			b.description('Executes demo command')
			b.option('demo-option')
				.banner('controls demo mode')
				.default(true)
				.alias('d')
			b.optarg('opt-arg')
				.banner('optional argument')
				.default('42')
		}
		def demo(args)
			p('Executing demo command...')
			p(args)
			p('... DONE')
		end

	end

	it 'adds metadata to methods' do
		annotations = Dummy::command_annotations()

		expect(annotations).not_to be_empty
		expect(annotations.has_key?(:demo)).to be true

		args = annotations[:demo]
		p(args)

		expect(args.respond_to?(:demo_option)).to be true
		expect(args.demo_option).to be true
		expect(args.respond_to?(:opt_arg)).to be true
		expect(args.opt_arg).to eq '42'

		args.opt_arg = 'test'
		expect(args.opt_arg).to eq 'test'

		Keen::TaskInvoker::invoke(Dummy, :demo, ['--no-demo-option', '--opt-arg=55'])
	end

end
