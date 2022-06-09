if path = ENV["MAJESTIC_MONOLITH_GEM_PATH"]
  gem "majestic-monolith", path: path
else
  gem "majestic-monolith"
end

after_bundle do
  generate "monolith:install"
end
