# frozen_string_literal: true
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require_relative "lib/omniauth/goodgame/version"

Gem::Specification.new do |spec|
  spec.name = "omniauth-goodgame"
  spec.version = Omniauth::Goodgame::VERSION
  spec.authors = ["Alex Seregin"]
  spec.email = ["quqiedeep@gmail.com"]

  spec.summary = "GoodGame OAuth2 Strategy for OmniAuth."
  spec.homepage = "https://github.com/Alex1324522/omniauth-goodgame"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = `git ls-files`.split($/)
  spec.require_paths = ["lib"]
  spec.add_runtime_dependency "omniauth-oauth2", "~> 1.6"

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
