require('keen/task')
require('keen/arguments/ArgumentParser')

module Keen

	class Runner < Task

		def self.start()
			k = Class.new()
		    k.class_eval do
				define_method(:doit) { puts("doing IT") }
			end

		 	x = k.new()
		 	x.doit()

		 	ArgumentParser.parse(ARGV)
		end
		#default_task(:list)

		#map '-v' => :version

		# Override Thor#help so it can give information about any command module
		def help(meth = nil)
			# if meth && !self.respond_to?(meth)
			# 	#initialize_thorfiles(meth)
			# 	#klass, command = Thor::Util.find_class_and_command_by_namespace(meth)
			# 	#self.class.handle_no_command_error(command, false) if klass.nil?
			# 	#klass.start(["-h", command].compact, :shell => shell)
			# else
			# 	super
			# end
		end

		# If a command is not found on Keen::Runner, method missing is invoked and
		# Keen::Runner is then responsible for finding the command in all classes.
		def method_missing(meth, *args)
			#meth = meth.to_s
			#initialize_thorfiles(meth)
			#klass, command = Thor::Util.find_class_and_command_by_namespace(meth)
			#self.class.handle_no_command_error(command, false) if klass.nil?
			#args.unshift(command) if command
			#klass.start(args, :shell => shell)
		end

		#desc 'version', 'Show Keen version'

		command({
			:desc => "show version information",
			:opts => {
				'test-on'.to_sym() => {
					:type => :boolean,
					:aliases => [:t],
				},
			},
		})
		def version
			require('keen/version')
			say("Keen #{Keen::VERSION}")
		end

		#desc 'list', 'Lists available commands'

		def list
			# keenDir = findCommandsDirectory()
			# if (keenDir)
			# 	puts("Using Keen dir #{keenDir}")
			# end
			#
			# d = Dir.new(keenDir)
			# d.each() do |name|
			# 	path = File.join(keenDir, name)
			# 	if (File.file?(path))
			# 		puts("Loading thorfile #{path}")
			# 		Thor::Util.load_thorfile(path, nil, nil)
			# 	end
			# end
			#
		 	# Thor::Base.subclasses.each() do |klazz|
			# 	p(klazz)
			# end

		end

	end

end
