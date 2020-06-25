class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def home
    render :layout => "application"
  end

  def logged_in?
    session[:user_id].present?
  end
end
