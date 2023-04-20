if path = ENV["MONOLITH_GEM_PATH"]
  gem "rubymonolith", path: path
else
  gem "rubymonolith"
end

after_bundle do
  generate "monolith:install"
end
