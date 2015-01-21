class ExceptionallyBeautiful::ErrorsController < ExceptionallyBeautiful::ApplicationController
  include ExceptionallyBeautiful::ErrorHandler

  def show
    error_handler(request.path[-3..-1])
  end
end
