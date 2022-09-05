class TripsController < ApplicationController
  before_action :set_profile

  def index
    @trips = Trip.all
    start_date = Date.new(params[:start_date].to_i)
    end_date = Date.new(params[:end_date].to_i)
    # raise
    # filter trips
    # @trips = @trips.map do |trip|
    #   if (trip.start_date..trip.end_date).overlaps?(start_date..end_date)
    #     trip
    #   end
    # end

    respond_to do |format|
      format.html
      # render partial (movies/list)
      format.text { render partial: "crags/travelling_climbers", locals: { trips: @trips }, formats: [:html] }
    end
  end

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
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    #@profile.user = current_user
    @crag = @trip.crag
    if @trip.update(trip_params)
      redirect_to profile_path(@profile)
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  def set_profile
    if Profile.exists?(params[:profile_id])
      @profile = Profile.find(params[:profile_id])
    end
  end

  def trip_params
    params.require(:trip).permit(:name, :start_date, :end_date, :crag_id)
  end
end
