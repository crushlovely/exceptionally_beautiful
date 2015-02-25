require 'exceptionally_beautiful/routing_constraint'

module ActionDispatch::Routing
  class Mapper
    def exceptionally_beautiful_routes
      match '(errors)/:status', :to => "#{ExceptionallyBeautiful.controller}##{ExceptionallyBeautiful.action}",
                                :constraints => ExceptionallyBeautiful::RoutingConstraint.new, :via => :all,
                                :as => :exceptionally_beautiful_error
    end
  end
end
