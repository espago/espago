# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'espago/version'

Gem::Specification.new do |gem|
  gem.name          = "espago"
  gem.version       = Espago::VERSION
  gem.authors       = ["Piotrek", "Szymon Fiedler","Waclaw Luczak"]
  gem.email         = ["developers@espago.com"]
  gem.description   = %q{Espago api wrapper}
  gem.summary       = %q{Espago api wrapper}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "faraday"
  gem.add_dependency "facets"
  gem.add_dependency "rails"

  gem.add_development_dependency "rspec"
  gem.add_development_dependency "pry"
  gem.add_development_dependency "guard-rspec"
  gem.add_development_dependency "simplecov"
  gem.add_development_dependency "fuubar"
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rb-fsevent', '~> 0.9.1'
  gem.add_development_dependency 'webmock'
  gem.add_development_dependency 'vcr'
  gem.add_development_dependency 'codeclimate-test-reporter'


end
