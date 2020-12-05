class RentsController < ApplicationController
  def new
    @bike = Bike.find(params[:bike_id])
    @rent = Rent.new
    authorize @rent
  end

  def create
    @rent = Rent.new(rent_params)
    @rent.bike = Bike.find(params[:bike_id])
    @rent.user = current_user
    if @rent.valid?
      @rent.status = 'leased'
      @rent.save
    else
      render :new
    end
    authorize @rent
  end

  def rent_params
    params.require(:rent).permit(:start_date, :end_date, :bike_id)
  end
end
