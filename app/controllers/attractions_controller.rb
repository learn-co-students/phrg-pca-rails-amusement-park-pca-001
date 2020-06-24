class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
    @user = User.find(session[:user_id])
  end

  def show
    @user = User.find(session[:user_id])
    @attraction = Attraction.find(params[:id])
  end

  def update
    @user = User.find(session[:user_id])
    @attraction = Attraction.find(params[:id])

    ride = Ride.create(user: @user, attraction: @attraction)

    flash.alert = ride.take_ride

    redirect_to user_path(@user)
  end

  def new
    user = User.find(session[:user_id])

    if user && user.admin
      @attraction = Attraction.new
    else
      redirect_to "/"
    end
  end

  def create
    @attraction = Attraction.new(attraction_params)

    if @attraction.save
      @attraction.save
      redirect_to attraction_path(@attraction)
    else
      redirect_to attractions_path
    end
  end

private

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :min_height, :nausea_rating, :happiness_rating)
  end
end