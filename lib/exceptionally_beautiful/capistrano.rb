require 'capistrano/version'

if defined?(Capistrano::VERSION) && Gem::Version.new(Capistrano::VERSION).release >= Gem::Version.new('3.0.0')
  load File.expand_path('../capistrano/exceptionally_beautiful.rake', __FILE__)
else
  fail LoadError
end
