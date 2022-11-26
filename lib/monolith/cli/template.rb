if path = ENV["MAJESTIC_MONOLITH_GEM_PATH"]
  gem "majesticmonolith", path: path
else
  gem "majesticmonolith"
end

after_bundle do
  generate "monolith:install"
end
