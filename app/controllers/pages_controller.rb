class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @profiles = Profile.all
  end

  def search
    @results = PgSearch.multisearch(params[:query])

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: "pages/results", locals: { results: @results }, formats: [:html] }
    end
    # raise
  end
end
