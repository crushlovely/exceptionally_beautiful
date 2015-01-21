module ActionDispatch::Routing
  class Mapper
    def exceptionally_beautiful_routes
      match '(errors)/:status', :to => "#{ExceptionallyBeautiful.controller}##{ExceptionallyBeautiful.action}",
                                :constraints => { :status => /\d{3}/ }, :via => :all
    end
  end
end
