# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'keen/version'

Gem::Specification.new do |spec|
  spec.name          = "keen"
  spec.version       = Keen::VERSION
  spec.authors       = ["Lukas Angerer"]
  spec.email         = ["lukas.angerer@gmail.com"]

  spec.summary       = %q{Modular command runner based on Thor}
  spec.description   = %q{Modular command runner based on Thor}
  spec.homepage      = "https://github.com/lord-executor/Keen"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "thor", "~> 0.19.1"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end