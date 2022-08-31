class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def search
    @crags = Crag.all
    @countries = Country.all
  end
end
