# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'utility_box/rails/version'

Gem::Specification.new do |gem|
  gem.name          = "utility_box"
  gem.version       = UtilityBox::Rails::VERSION
  gem.platform      = Gem::Platform::RUBY
  gem.authors       = ["Grant Klinsing"]
  gem.email         = ["grant@digitalopera.com"]
  gem.description   = %q{CSS and JS utility toolbox for Rails}
  gem.summary       = %q{Adds a bunch of utility Javascript and CSS scaffolding via Twitter Bootstrap}
  gem.homepage      = "https://github.com/digitalopera/utility_box"

  gem.files         = Dir["{lib,app,vendor}/**/*"] +
                      [
                        'Gemfile',
                        'LICENSE.txt',
                        'Rakefile',
                        'README.md'
                      ]
  gem.require_paths = ["lib"]

  gem.add_dependency 'therubyracer'
  gem.add_dependency 'less-rails'
  gem.add_dependency 'twitter-bootstrap-rails', '~> 2.2.3'
  gem.add_dependency 'pusher_rails'
  gem.add_dependency 'railties', '>= 3.1'
  gem.add_development_dependency 'rails', '>= 3.1'
end
