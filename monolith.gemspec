require_relative "lib/monolith/version"

Gem::Specification.new do |spec|
  spec.name        = "monolith"
  spec.version     = Monolith::VERSION
  spec.authors     = ["Brad Gessler"]
  spec.email       = ["bradgessler@gmail.com"]
  spec.homepage    = "https://github.com/rocketship/monolith"
  spec.summary     = "Sane defaults for building SaaS applications on Rails."
  spec.license     = "MIT"
  
  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib,exe}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.0.3"
  spec.add_dependency "thor"
end
