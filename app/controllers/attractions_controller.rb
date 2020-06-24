class AttractionsController < ApplicationController
  before_action :find_attraction, only: %i[edit show update]

  def new
    @attraction = Attraction.new
  end

  def create
    attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(attraction)
  end

  def edit; end

  def index
    @attractions = Attraction.all
    @user = User.find(session[:user_id])
  end

  def show; end

  def update
    @attraction.update(attraction_params)

    redirect_to attraction_path(@attraction)
  end

private

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end

  def find_attraction
    @attraction = Attraction.find(params[:id])
  end
end
