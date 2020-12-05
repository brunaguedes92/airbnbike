class RentsController < ApplicationController
  before_action :set_bike

  def new
    @rent = Rent.new
    authorize @rent
  end

  def create
    @rent = Rent.new(rent_params)
    @rent.bike = @bike
    @rent.user = current_user
    if @rent.valid?
      @rent.status = 'leased'
      @rent.save
      redirect_to root_path
    else
      render :new
    end
    authorize @rent
  end

  private

  def set_bike
    @bike = Bike.find(params[:bike_id])
  end

  def rent_params
    params.require(:rent).permit(:start_date, :end_date, :bike_id)
  end
end
