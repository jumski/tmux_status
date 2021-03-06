# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tmux_status/version'

Gem::Specification.new do |gem|
  gem.name          = "tmux_status"
  gem.version       = TmuxStatus::VERSION
  gem.authors       = ["Wojtek Majewski"]
  gem.email         = ["jumski@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'pry'
  gem.add_development_dependency 'pry-debugger'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'rspec-core'
  gem.add_development_dependency 'mocha'
  gem.add_development_dependency 'fivemat'
  gem.add_development_dependency 'guard-shell'
  gem.add_development_dependency 'timecop'
  # gem.add_development_dependency 'simplecov'
end
