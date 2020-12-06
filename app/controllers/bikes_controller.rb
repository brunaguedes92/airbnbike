class BikesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show index]

  def index
    # @bikes = policy_scope(Bike).order(created_at: :desc)
    @bikes = Bike.all
    @markers = @bikes.geocoded.map do |bike|
      {
        lat: bike.latitude,
        lng: bike.longitude
      }
    end
  end

  def show
    @bike = Bike.find(params[:id])
    @order = Order.new
    @rent = Rent.new
    @markers = [{
      lat: @bike.latitude,
      lng: @bike.longitude
    }]
    authorize @bike
  end

  def new
    @bike = Bike.new
    authorize @bike
  end

  def create
    @bike = Bike.new(bike_params)
    @bike.user = current_user
    authorize @bike

    if @bike.save
      redirect_to bike_path(@bike)
    else
      render :new
    end
  end

  private

  def bike_params
    params.require(:bike).permit(:address, :description, :title, :price, :photo)
  end
end
