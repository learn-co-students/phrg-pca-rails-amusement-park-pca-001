class UsersController < ApplicationController
  before_action :set_user
  skip_before_action :set_user, only: %i[new create]

  def show
    if params[:id].to_i == session[:user_id]
      @user
    else
      redirect_to "/"
    end
  end

  def new
    @user = User.new
  end

  def update
    @user = User.find(session[:user_id])
    @attraction = Attraction.find(params[:user][:attraction_id])

    ride = Ride.create(user: @user, attraction: @attraction)

    flash.alert = ride.take_ride

    redirect_to user_path(@user)
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
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
