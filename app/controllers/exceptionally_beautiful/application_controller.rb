module ExceptionallyBeautiful
  class ApplicationController < ::ApplicationController
    helper Rails.application.routes.url_helpers
    helper ExceptionallyBeautiful::RenderHelper
  end
end
