class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def search
    @crags = Crag.all
    @countries = Country.all
    @results = PgSearch.multisearch(params[:query])

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: "pages/list", locals: { results: @results }, formats: [:html] }
    end
  end
end
