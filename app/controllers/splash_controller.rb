class SplashController < ApplicationController
  protect_from_forgery with: :null_session
  skip_before_action :authenticate_user!
  def show
    redirect_to categories_index_path if user_signed_in?
  end
end
