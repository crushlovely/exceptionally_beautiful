namespace :exceptionally_beautiful do
  desc "Cache all Exceptionally Beautiful error pages in your application's public folder"
  task :cache => :environment do
    app = ActionDispatch::Integration::Session.new(Rails.application)
    app.https!

    ExceptionallyBeautiful.errors.each do |error_code|
      app.get "/#{error_code}"

      file_path = Rails.root.join('public')
      file_name = "/#{error_code}.html"

      File.open([file_path, file_name].join, 'w') { |f| f.write(app.response.body) }
    end
  end
end