
class Task
	def self.command(metadata)
		p(metadata)
		@last = metadata
	end

	def self.method_added(m)
		puts("defining method #{m}")
		p(@last)

		meth = self.instance_method(m)
		p(meth)

		@last = nil
	end
end
