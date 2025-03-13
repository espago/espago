lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'espago/version'

Gem::Specification.new do |gem|
  gem.name          = 'espago'
  gem.version       = Espago::VERSION

  gem.required_ruby_version = '>= 3.1.0'

  gem.authors       = ["Piotrek", "Szymon Fiedler","Waclaw Luczak", "faramund"]
  gem.email         = ["developers@espago.com"]
  gem.description   = %q{Espago api wrapper}
  gem.summary       = %q{Espago api wrapper}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  gem.executables   = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_dependency "faraday", '>= 2.0.0'
  gem.add_dependency "json", '>= 2.10.2'
  gem.add_dependency "rails"

  gem.add_development_dependency "rspec", '>= 3.13.0'
  gem.add_development_dependency 'rspec-its'
  gem.add_development_dependency "byebug"
  gem.add_development_dependency "pry"
  gem.add_development_dependency "guard-rspec"
  gem.add_development_dependency "simplecov", '>= 0.22.0'
  gem.add_development_dependency "fuubar"
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rb-fsevent', '~> 0.9.1'
  gem.add_development_dependency 'webmock', '~> 3.25'
  gem.add_development_dependency 'vcr', '~> 6.3'

  gem.add_development_dependency 'mutex_m', '~> 0.3.0'
  # gem.add_development_dependency 'codeclimate-test-reporter'
end
