require_relative "../generators/base.rb"

class Monolith::ViewGenerator < Monolith::Generators::Base
  source_root File.expand_path("templates", __dir__)

  desc "Installs gems to manage views in Monolith"

  def append_gemfile
    # Encapsulate views (instead of using partials)
    gem "phlex-rails"
  end

  def bundle_gems
    bundle_command "install"
  end

  def install_gems
    generate "phlex:install"
  end
end
