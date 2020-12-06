class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @bikes = policy_scope(Bike).order(created_at: :desc)

    @markers = @bikes.geocoded.map do |bike|
      {
        lat: bike.latitude,
        lng: bike.longitude,
        infoWindow: render_to_string(partial: "bikes/shared/info_window", locals: { bike: bike }),
        image_url: helpers.asset_url('marcador_bike.svg')
      }
    end
  end
end
