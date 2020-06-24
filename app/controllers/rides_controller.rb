class RidesController < ApplicationController
  def create
    ride = Ride.create(ride_params)
    flash.alert = ride.take_ride

    redirect_to user_path(params[:ride][:user_id])
  end

private

  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end

end