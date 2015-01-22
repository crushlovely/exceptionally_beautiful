$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'exceptionally_beautiful/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = 'exceptionally_beautiful'
  spec.version     = ExceptionallyBeautiful::VERSION
  spec.authors     = ['PJ Kelly']
  spec.email       = ['pj@crushlovely.com']
  spec.homepage    = 'https://github.com/crushlovely/exceptionally_beautiful'
  spec.summary     = 'A Rails engine for handling error pages.'
  spec.description = 'A Rails engine for handling error pages.'
  spec.license     = 'MIT'

  spec.files         = `git ls-files`.split("\n")
  spec.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")

  spec.add_dependency('rails', '~> 4.2.0.beta1')
  spec.add_dependency('redcarpet', '> 3.0.0')
  spec.add_development_dependency('bundler', '~> 1.3')
  spec.add_development_dependency('pry')
  spec.add_development_dependency('rake')
  spec.add_development_dependency('rspec')
  spec.add_development_dependency('rspec-rails')
  spec.add_development_dependency('capybara')
  spec.add_development_dependency('rubocop')
  spec.add_development_dependency('guard')
  spec.add_development_dependency('guard-rspec')
  spec.add_development_dependency('guard-rubocop')
  spec.add_development_dependency('codeclimate-test-reporter')
end
