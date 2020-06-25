class SessionsController < ApplicationController
  def signin
    @user = User.new
  end

  def create
    user = User.find(params[:user][:name])
    return unless user.authenticate(params[:user][:password])
    redirect_to user_path(user)
  end


end