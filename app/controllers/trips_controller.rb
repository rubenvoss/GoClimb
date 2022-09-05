class TripsController < ApplicationController
  before_action :set_profile

  def index
    @trips = Trip.all
    start_date = params[:start_date]
    end_date = params[:end_date]

    # filter trips

    # create partial (movies/list)

    respond_to do |format|
      format.html
      format.text { render partial: "crags/travelling_climbers", locals: {trips: @trips}, formats: [:html] }
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
    @profile = Profile.find(params[:profile_id])
  end

  def trip_params
    params.require(:trip).permit(:name, :start_date, :end_date, :crag_id)
  end
end
