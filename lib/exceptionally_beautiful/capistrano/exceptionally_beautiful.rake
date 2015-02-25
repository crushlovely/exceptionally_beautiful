namespace :exceptionally_beautiful do
  desc "Cache all Exceptionally Beautiful error pages in your application's public folder"
  task :cache do
    on roles fetch(:exceptionally_beautiful_roles) do |host|
      within release_path do
        with :rails_env => fetch(:rails_env) do
          execute :rake, 'exceptionally_beautiful:cache'
        end
      end
    end
  end
end

namespace :load do
  task :defaults do
    set :exceptionally_beautiful_roles, -> { :app }
  end
end