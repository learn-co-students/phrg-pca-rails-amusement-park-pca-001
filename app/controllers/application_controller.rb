class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def home
  end

  def logged_in?
    session[:user_id].present?
  end
end
