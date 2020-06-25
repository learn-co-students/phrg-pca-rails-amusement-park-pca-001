class RidesController < ApplicationController
  def new
  end

  def create
    ride = Ride.new(user_id: params[:ride][:user_id], attraction_id: params[:ride][:attraction_id])
    ride.take_ride
    redirect_to user_path(ride.user)
  end
end