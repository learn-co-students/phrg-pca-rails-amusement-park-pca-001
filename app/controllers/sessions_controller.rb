class SessionsController < ApplicationController
  def new
    @users = User.new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    authenticated = user.authenticate(params[:password])
    if authenticated
      session[:user_id] = user.id

      redirect_to user_path(user)
    else
      redirect_to root_path
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end
end
