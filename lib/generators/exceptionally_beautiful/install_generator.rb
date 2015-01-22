require 'rails/generators/base'
require 'securerandom'

module ExceptionallyBeautiful
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../../templates', __FILE__)

      def copy_initializer
        template 'exceptionally_beautiful.rb', 'config/initializers/exceptionally_beautiful.rb'
      end

      def copy_locale
        copy_file '../../../config/locales/en.yml', 'config/locales/exceptionally_beautiful.en.yml'
      end

      def add_exceptionally_beautiful_route
        route 'exceptionally_beautiful_routes'
      end
    end
  end
end
