module ExceptionallyBeautiful
  class RoutingConstraint
    def matches?(request)
      status = request.env['action_dispatch.request.path_parameters'][:status]
      !status.nil? && status.match(/\d{3}/) && ExceptionallyBeautiful.errors.include?(status.to_i)
    end
  end
end
