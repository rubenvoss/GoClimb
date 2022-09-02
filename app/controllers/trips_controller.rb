class TripsController < ApplicationController
  before_action :set_profile

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    if @trip.save
      redirect_to profile_path(@profile)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  private

  def set_profile
    @profile = Profile.find(params[:profile_id])
  end

  def trip_params
    params.require(:trip).permit(:name, :start_date, :end_date, :crag_id)
  end
end
