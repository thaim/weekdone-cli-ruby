require_relative 'lib/weekdone/cli/version'

Gem::Specification.new do |spec|
  spec.name          = "weekdone-cli"
  spec.version       = Weekdone::Cli::VERSION
  spec.authors       = ["thaim"]
  spec.email         = ["thaim24@gmail.com"]

  spec.summary       = "cli for weekdone"
  spec.description   = "cli for weekdone"
  spec.homepage      = "https://github.com/thaim/weekdone-cli-ruby"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "http://mygemserver.com"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "thor", "~> 1.0"
  spec.add_dependency "weekdone-sdk", "~> 0.3"
end
