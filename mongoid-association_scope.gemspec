# frozen_string_literal: true

require_relative "lib/mongoid/association_scope/version"

Gem::Specification.new do |spec|
  spec.name          = "mongoid-association_scope"
  spec.version       = Mongoid::AssociationScope::VERSION
  spec.authors       = ["lychee xing"]
  spec.email         = ["lolychee@gmail.com"]

  spec.summary       = "Mongoid::AssociationScope add support scopes in association definitions"
  spec.description   = ""
  spec.homepage      = "https://github.com/lolychee/mongoid-association_scope"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.6.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/lolychee/mongoid-association_scope"
  spec.metadata["changelog_uri"] = "https://github.com/lolychee/mongoid-association_scope/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "mongoid", ">= 5.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
