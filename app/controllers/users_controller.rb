class UsersController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def show
    @user = User.find_by(id: session[:user_id])
  end

  def create
    user = User.create(user_params)
    session[:user_id] = user.id
    redirect_to user_path(user)
  end




private
  def require_login
    if session[:user_id].nil?
      redirect_to '/'
    end
  end

  def user_params
    params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
  end

end