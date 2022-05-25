module Majestic
  module Monolith
    module Templates
      class Alpha
        # I've found its best to name Rails applications "server", which keeps the product
        # name out of the code, and put the project inside of a path with the product name.
        # For example, `~/Projects/acme/server`. This makes it easier to put client code in
        # the same directly, like `~/Projects/acme/ios-app`.
        DEFAULT_PROJECT_NAME = "server".freeze

        attr_reader :name

        def initialize(name:)
          @name = name
        end

        def template_path
          root.join("template.rb")
        end

        def template_dir
          root.join("template")
        end

        def root
          Monolith.root.join "monolith/templates", File.basename(__FILE__, ".rb")
        end

        def rails_new_command
          "rails new #{rails_path} --template #{template_path} --database postgresql --css tailwind"
        end

        def rails_path
          Pathname.new(name)
        end
      end
    end
  end
end
