class RidesController < ApplicationController
  def create
    ride = current_user.rides.build(attraction_id: params[:ride][:attraction_id])
    result = ride.take_ride
    redirect_to user_path(current_user), flash: { notice: result.to_s }
  end
end
