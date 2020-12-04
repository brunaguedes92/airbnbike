class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @bikes = policy_scope(Bike).order(created_at: :desc)
  end
end
