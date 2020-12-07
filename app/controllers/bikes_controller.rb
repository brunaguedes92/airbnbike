class BikesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show index]

  def index
    @bikes = policy_scope(Bike).order(created_at: :desc)
    @markers = @bikes.geocoded.map do |bike|
      {
        lat: bike.latitude,
        lng: bike.longitude,
        infoWindow: render_to_string(partial: "bikes/shared/info_window", locals: { bike: bike }),
        image_url: helpers.asset_url('marcador_bike.svg')
      }
    end
    if params[:query].present?
      # sql_query = " title @@ :query OR description @@ :query"
      # @bikes = Bike.where(sql_query, query: "%#{params[:query]}%")
      @bikes = Bike.search_by_title_and_description(params[:query])
    end
  end

  def show
    @bike = Bike.find(params[:id])
    @order = Order.new
    @rent = Rent.new
    @markers = [{
      lat: @bike.latitude,
      lng: @bike.longitude,
      infoWindow: render_to_string(partial: "bikes/shared/info_window", locals: { bike: @bike }),
      image_url: helpers.asset_url('marcador_bike.svg')
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

  def my_bikes
    @bikes = Bike.where(user_id: current_user)
    authorize @bikes
  end

  private

  def bike_params
    params.require(:bike).permit(:address, :description, :title, :price, :photo)
  end
end
