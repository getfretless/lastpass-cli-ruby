# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lastpass-cli/version'

Gem::Specification.new do |spec|
  spec.name          = "lastpass-cli"
  spec.version       = LastpassCLI::VERSION
  spec.authors       = ["David Jones", "Dave Strus"]
  spec.email         = ["unixmonkey1@gmail.com", "dave@getfretless.com"]

  spec.summary       = %q{A Ruby wrapper for the LastPass CLI}
  spec.description   = %q{A Ruby wrapper for the LastPass CLI}
  spec.homepage      = "https://github.com/QuantifiAi/lastpass-cli-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "pry", "~> 0.11"
end
