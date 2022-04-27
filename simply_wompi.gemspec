# frozen_string_literal: true

require_relative "lib/simply_wompi/version"

Gem::Specification.new do |spec|
  spec.name = "simply_wompi"
  spec.version = SimplyWompi::VERSION
  spec.authors = ["Simply Development", "Jorge Castillo"]
  spec.email = %w[contact@simply-development,com j@simply-development.com]

  spec.summary = "Wompi implementation."
  spec.description = "Ruby implementation of Wompi Payment transactions gateway."
  spec.homepage = "https://github.com/Simply-Development/Wompi-Ruby-Gem"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Simply-Development/Wompi-Ruby-Gem"
  spec.metadata["changelog_uri"] = "https://github.com/Simply-Development/Wompi-Ruby-Gem"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end

  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
