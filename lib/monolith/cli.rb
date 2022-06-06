require "thor"

module Monolith
  class CLI < Thor
    include Thor::Actions

    DEFAULT_PROJECT_NAME = "server".freeze

    desc 'new [PROJECT_NAME]', 'create a new Rails monolith'
    def new(project_name = DEFAULT_PROJECT_NAME)
      template_path = File.join File.expand_path(__dir__), "template.rb"
      run "rails new #{project_name} --template #{template_path} --database postgresql --css tailwind"
    end
  end
end
