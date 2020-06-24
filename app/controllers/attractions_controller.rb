class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  def update
    @user = User.find(session[:user_id])
    @attraction = Attraction.find(params[:id])

    ride = Ride.create(user: @user, attraction: @attraction)

    flash.alert = ride.take_ride

    redirect_to user_path(@user)
  end
end