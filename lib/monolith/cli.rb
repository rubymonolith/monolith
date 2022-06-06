require "thor"

module Monolith
  class CLI < Thor
    include Thor::Actions

    DEFAULT_PROJECT_NAME = "server".freeze

    desc 'new [PROJECT_NAME]', 'create a new Rails monolith'
    def new(project_name = DEFAULT_PROJECT_NAME)
    end
  end
end
