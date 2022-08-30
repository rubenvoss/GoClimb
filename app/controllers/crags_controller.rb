class CragsController < ApplicationController
  def show
    @crag = Crag.find(params[:id])
  end
end
