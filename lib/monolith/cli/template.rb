if path = ENV["MONOLITH_GEM_PATH"]
  gem "monolith", path: path
else
  gem "monolith"
end

after_bundle do
  rails_command "generate monolith:install"
end
