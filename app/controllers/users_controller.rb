class UsersController < ApplicationController
  before_action :set_user
  skip_before_action :set_user, only: [:new, :create]

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render "users/new"
    end
  end

private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
