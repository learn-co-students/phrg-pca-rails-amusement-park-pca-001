class SessionsController < ApplicationController
  def signin
    @user = User.new
  end

  def create
    user = User.find(params[:user][:name])
    return unless user.authenticate(params[:user][:password])
    session[:user_id] = user.id
    redirect_to user_path(user)
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end

