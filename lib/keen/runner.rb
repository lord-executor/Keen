require('thor')

module Keen

	class Runner < Thor
		map '-v' => :version

		# Override Thor#help so it can give information about any command module
		def help(meth = nil)
			if meth && !self.respond_to?(meth)
				#initialize_thorfiles(meth)
				#klass, command = Thor::Util.find_class_and_command_by_namespace(meth)
				#self.class.handle_no_command_error(command, false) if klass.nil?
				#klass.start(["-h", command].compact, :shell => shell)
			else
				super
			end
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

		desc 'version', 'Show Keen version'

		def version
			require('keen/version')
			say("Keen #{Keen::VERSION}")
		end

		desc 'list', 'Lists available commands'

		def list
			keenDir = findCommandsDirectory()
			if (keenDir)
				puts("Using Keen dir #{keenDir}")
			end

		end

		private

		def findCommandsDirectory
			oldDir = ''
			searchDir = Dir.pwd

			while (oldDir != searchDir)
				keenDir = File.join(searchDir, '.keen')

				if (Dir.exists?(keenDir))
					return keenDir
				end

				puts(searchDir)
				oldDir = searchDir
				searchDir = File.expand_path(File.join(searchDir, '..'))
			end
		end
	end

end
