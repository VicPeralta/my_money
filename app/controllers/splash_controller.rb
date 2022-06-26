class SplashController < ApplicationController
  protect_from_forgery with: :null_session
  skip_before_action :authenticate_user!
  def show; end
end
