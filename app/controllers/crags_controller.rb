class CragsController < ApplicationController
  def show
    @crag = Crag.find(params[:id])
    if params[:start_date] && params[:end_date]
      @trips = Trip.where(crag_id: @crag_id).where(start_date: params[:start_date]).or(Trip.where(end_date: params[:end_date]))
    end
  end
end
