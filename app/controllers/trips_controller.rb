class TripsController < ApplicationController
  before_action :set_profile

  def index
    # turning the date string into a date instance
    # splits the string at the underscore
    # makes an array of integers
    start_date_array = params[:start_date].split("_").map { |string| string.to_i }
    end_date_array = params[:end_date].split("_").map { |string| string.to_i }

    # makes a date instance from the date arrays
    start_date = Date.new(start_date_array[0], start_date_array[1], start_date_array[2])
    end_date = Date.new(end_date_array[0], end_date_array[1], end_date_array[2])

    # filter trips
    @trips = Trip.all
    @trips = @trips.map do |trip|
      if (trip.start_date..trip.end_date).overlaps?(start_date..end_date) then
        trip
      end
    end

    # removes all nil values of array
    @trips = @trips.compact

    respond_to do |format|
      format.html
      # render partial (movies/list)
      format.text { render partial: "crags/travelling_climbers", locals: { trips: @trips }, formats: [:html] }
    end

    # raise
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
    @trip.update(trip_params)

    respond_to do |format|
      format.html { redirect_to profile_path(@profile) }
      format.text { render partial: "trip_info", locals: { profile: @profile, trip: @trip }, formats: [:html] }
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
