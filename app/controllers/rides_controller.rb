class RidesController < ApplicationController
  def create
    ride = current_user.rides.build(attraction_id: params[:ride][:attraction_id])
    message = ride.take_ride
    redirect_to user_path(current_user), flash: { notice: "#{message}" }
  end
end