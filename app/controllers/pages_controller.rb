class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def search
    @results = PgSearch.multisearch(params[:query])
    @result = @results.first

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: "pages/list", locals: { results: @results }, formats: [:html] }
    end
  end
end
