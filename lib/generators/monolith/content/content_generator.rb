require_relative "../generators/base.rb"

class Monolith::ContentGenerator < Monolith::Generators::Base
  source_root File.expand_path("templates", __dir__)

  desc "Installs gems to manage content"

  def append_gemfile
    # Manage content via Sitepress in ./app/content
    gem "sitepress-rails", git: "https://github.com/sitepress/sitepress.git"

    # Hackable markdown renderers that make plugging Markdown into Rails a
    # much more sane proposition.
    gem "markdown-rails", git: "https://github.com/sitepress/markdown-rails.git"
  end

  def bundle_gems
    bundle_command "install"
  end

  def install_gems
    generate "sitepress:install"
    generate "markdown_rails:install"
  end
end
