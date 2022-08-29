class ProfilesController < ApplicationController
  def show
    @profile = Profile.find(params[:id])
  end

  def new
    @profile = Profile.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def profile_params
  end
end
