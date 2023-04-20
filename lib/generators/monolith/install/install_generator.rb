require_relative "../generators/base.rb"

class Monolith::InstallGenerator < Monolith::Generators::Base
  source_root File.expand_path("templates", __dir__)

  desc "Installs gems and frameworks for Monolith"

  def append_gemfile
    gem "rubymonolith"
  end

  def bundle_gems
    bundle_command "install"
  end

  def install_gems
    generate "monolith:content"
    generate "monolith:view"
  end

  def append_gemfile
    # Some people hate rspec. No idea why, but I dig it, so its part of monolith.
    gem "rspec-rails", group: [:development, :test]

    # More sane than fixtures
    gem "factory_bot", group: [:development, :test]
  end

  def copy_files
    template "Brewfile"
    directory "github", ".github"
  end

  def post_install_message
    say_status "next steps", <<~DOCS
    [ ] Run `./bin/rails db:create db:migrate`
    [ ] Launch the server via `./bin/dev`
    [ ] Open `http://localhost:3000` in your browser
    DOCS
  end
end
