###### Authorization & Authentication ######

# Huh!? No omni-auth! Correct ... we just handle logins via email to start. Way
# less configuration and you need email addresses.
gem "nopassword", github: "rocketshipio/nopassword", branch: "main"

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
gem "sitepress-rails", github: "sitepress/sitepress"

# Lots of markdown content for help, feature, and how-to articles.
gem "markdown-rails", "~> 1.0"

###### Analytics ######

# First-party analytics keeps privacy sane and Google out.
gem "ahoy_matey"

# Useful for running queries against Ahoy.
gem "groupdate"

# Send all web addresses to one URL.
gem "rack-canonical-host", "~> 1.1"

###### Testing ######

# Some people hate rspec. No idea why, but I dig it, so its part of monolith.
gem "rspec-rails", group: [:development, :test]

# More sane than fixtures
gem "factory_bot", group: [:development, :test]

##### Other gems ######

# Get paid yo.
gem "stripe"

# Parses dates
gem "chronic", "~> 0.10.2"

after_bundle do
  rails_command "db:create"
  rails_command "generate ahoy:install"
  rails_command "db:migrate"
end
