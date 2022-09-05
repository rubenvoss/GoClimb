class CragsController < ApplicationController
  def show
    @crag = Crag.find(params[:id])
    @marker = @crag.geocoded.map do
      {
        lat: @crag.lat,
        lng: @crag.long
      }
    end
    if params[:start_date] && params[:end_date]
      @trips = Trip.where(crag_id: @crag_id).where(start_date: params[:start_date]).or(Trip.where(end_date: params[:end_date]))
    end
    respond_to do |format|
        format.html
        format.json # Follow the classic Rails flow and look for a create.json view
    end
    # render :json => {:name => "any name"}
  end
end
