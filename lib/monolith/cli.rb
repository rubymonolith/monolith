require "thor"
require "monolith/version"

module Monolith
  class CLI < Thor
    include Thor::Actions

    DEFAULT_PROJECT_NAME = "server".freeze

    desc "new [PROJECT_NAME]", "create a new Rails monolith"
    def new(project_name = DEFAULT_PROJECT_NAME)
      template_path = File.join File.expand_path(__dir__), "cli/template.rb"
      run "rails new #{project_name} --template #{template_path} --database postgresql --css tailwind"
    end

    desc "version", "prints version of monolith"
    def version
      puts Monolith::VERSION
    end

    desc "server", "Runs a monolith application"
    def server
      puts Monolith::VERSION
    end
  end
end
