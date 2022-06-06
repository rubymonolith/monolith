if path = ENV["MONOLITH_GEM_PATH"]
  gem "monolith", path: path
else
  gem "monolith"
end

after_bundle do
  generate "monolith:install"
end
