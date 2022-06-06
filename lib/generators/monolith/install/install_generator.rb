class Monolith::InstallGenerator < Rails::Generators::Base
  source_root File.expand_path("templates", __dir__)

  desc "Installs the base gems for Monolith"

  def append_gemfile
    ###### Authorization & Authentication ######

    # Huh!? No omni-auth! Correct ... we just handle logins via email to start. Way
    # less configuration and you need email addresses.
    gem "nopassword", git: "https://github.com/rocketshipio/nopassword.git", branch: "main"

    # Objects for authorizing user actions.
    gem "pundit"

    ###### Views & UI ######

    # Encapsulate views (instead of using partials)
    gem "view_component"

    # I use to not like Tailwind, but now I love using it with view_components.
    gem "tailwindcss-rails"

    # Displays UTC times from the database in the users local time, all computed client-side.
    # Super duper useful for keeping times sane
    gem "local_time"

    # Instead of HAML or Erb. What's that? You don't like these shorthand template
    # languages? I don't like chasing down empty Erb tags in a heavily compentized
    # application, so slim wins the day.
    gem "slim-rails", "~> 3.3"

    ###### Content Management ######

    # Content is managed via Sitepress
    gem "sitepress-rails", git: "https://github.com/sitepress/sitepress.git"

    # Lots of markdown content for help, feature, and how-to articles.
    gem "markdown-rails", "~> 1.0"

    ###### Analytics ######

    # First-party analytics keeps privacy sane and Google out.
    gem "ahoy_matey"

    # Useful for running queries against Ahoy.
    gem "groupdate"

    ###### Testing ######

    # Some people hate rspec. No idea why, but I dig it, so its part of monolith.
    gem "rspec-rails", group: [:development, :test]

    # More sane than fixtures
    gem "factory_bot", group: [:development, :test]

    ##### Other gems ######

    # Parses dates
    gem "chronic", "~> 0.10.2"

    # Send all web addresses to the URL defined via CANONICAL_HOST, if present.
    gem "rack-canonical-host", "~> 1.1"
  end

  def copy_files
    template "Brewfile"
    directory "github", ".github"
  end

  def bundle_gems
    bundle_command "install"
  end

  def install_sitepress
    generate "sitepress:install"
  end

  def install_nopassword
    generate "nopassword:install"
  end

  def install_ahoy
    generate "ahoy:install"
  end

  def post_install_message
    say_status "next steps", <<~DOCS
    [ ] Run `rails db:migrate`
    [ ] Run `bundle install`
    [ ] Launch the server via `dev`
    [ ] Go to `http://localhost:3000`
    DOCS
  end

  private
    # Lifted from https://github.com/bradgessler/rails/blob/bbd298d7b036c550912139b41903f9f37087befe/railties/lib/rails/generators/app_base.rb#L380-L404,
    # which is not ideal. I tried to inherit `AppBase`, which also didn't work because it wanted an argument, which
    # this generator does not need. Look into moving this into a module in Rails core and the including that in here
    # or decomposing the `AppBase` Thor class in a way that would let me inherit it.
    def bundle_command(command, env = {})
      say_status :run, "bundle #{command}"

      # We are going to shell out rather than invoking Bundler::CLI.new(command)
      # because `rails new` loads the Thor gem and on the other hand bundler uses
      # its own vendored Thor, which could be a different version. Running both
      # things in the same process is a recipe for a night with paracetamol.
      #
      # Thanks to James Tucker for the Gem tricks involved in this call.
      _bundle_command = Gem.bin_path("bundler", "bundle")

      require "bundler"
      Bundler.with_original_env do
        exec_bundle_command(_bundle_command, command, env)
      end
    end

    def exec_bundle_command(bundle_command, command, env)
      full_command = %Q["#{Gem.ruby}" "#{bundle_command}" #{command}]
      if options[:quiet]
        system(env, full_command, out: File::NULL)
      else
        system(env, full_command)
      end
    end
end
