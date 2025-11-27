# frozen_string_literal: true

require_relative "lib/CTF_Pal/version"

Gem::Specification.new do |spec|
  spec.name = "CTF_Pal"
  spec.version = CTFPal::VERSION
  spec.authors = ["Michael-Meade"]
  spec.email = ["noway@lol.com"]

  spec.summary = ""
  spec.description = ""
  #spec.homepage = "TODO: Put your gem's website or public repo URL here."
  #spec.required_ruby_version = ">= 3.2.0"

  #spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"
  #spec.metadata["homepage_uri"] = spec.homepage
  #spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = Dir.glob('lib/**/*', File::FNM_DOTMATCH)
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
