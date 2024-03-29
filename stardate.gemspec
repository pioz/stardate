lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'stardate/version'

Gem::Specification.new do |spec|
  spec.name          = 'ruby-stardate'
  spec.version       = Stardate::VERSION
  spec.authors       = ['pioz']
  spec.email         = ['enrico@megiston.it']
  spec.description   = 'Calculates the Star Trek stardate and vice versa'
  spec.summary       = 'Calculates the Star Trek stardate and vice versa.'
  spec.homepage      = 'https://github.com/pioz/stardate'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.4.0'
  spec.add_dependency 'activesupport', '>= 4'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'byebug'
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-performance'
end
