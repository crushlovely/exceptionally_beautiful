class TestsController < ApplicationController
  def index
    fail 'This action is totally borked!'
  end

  def show
    # raise ActionController::InvalidAuthenticityToken
  end
end
