module ExceptionallyBeautiful
  class Engine < ::Rails::Engine
    isolate_namespace ExceptionallyBeautiful

    config.autoload_paths += Dir["#{config.root}/app/**/"]

    initializer 'exceptionally_beautiful.update_exceptions_app' do |app|
      app.config.exceptions_app = app.routes
    end
  end
end
