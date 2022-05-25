require "thor"

module Majestic
  module Monolith
    class CLI < Thor
      include Thor::Actions

      desc 'new [PROJECT_NAME]', 'create a new Rails monolith'
      def new(project_name = Templates::Alpha::DEFAULT_PROJECT_NAME)
        project = Templates::Alpha.new(name: project_name)
        run project.rails_new_command
        directory project.template_dir.expand_path, project.rails_path.expand_path
      end
    end
  end
end
