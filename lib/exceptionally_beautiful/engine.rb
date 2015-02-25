module ExceptionallyBeautiful
  class Engine < ::Rails::Engine
    isolate_namespace ExceptionallyBeautiful

    config.autoload_paths += Dir["#{config.root}/app/**/"]

    initializer 'exceptionally_beautiful.update_exceptions_app' do |app|
      app.config.exceptions_app = app.routes
    end

    rake_tasks do
      load config.root.join('lib/exceptionally_beautiful/tasks/exceptionally_beautiful.rake')
    end
  end
end
