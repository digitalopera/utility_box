# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'utility_box/rails/version'

Gem::Specification.new do |gem|
  gem.name          = "utility_box"
  gem.version       = UtilityBox::Rails::VERSION
  gem.platform      = Gem::Platform::RUBY
  gem.authors       = ["Grant Klinsing"]
  gem.email         = ["grant@grantrklinsing.com"]
  gem.description   = %q{CSS and JS utility toolbox}
  gem.summary       = %q{CSS and JS utility toolbox}
  gem.homepage      = ""

  gem.files         = Dir["{lib,app,vendor}/**/*"] +
                      [
                        'Gemfile',
                        'LICENSE.txt',
                        'Rakefile',
                        'README.md'
                      ]
  gem.require_paths = ["lib"]

  gem.add_dependency 'bootstrap-sass', '~> 2.2.2.0'
  gem.add_dependency 'font-awesome-sass-rails'
  gem.add_dependency 'pusher_rails'
  gem.add_dependency 'railties', '>= 3.1'
  gem.add_development_dependency 'rails', '>= 3.1'
end
