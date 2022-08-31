class ProfilesController < ApplicationController
  def show
    @profile = Profile.find(params[:id])
    @crag = @profile.crag
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.crag = Crag.find(profile_params[:crag_id])
    @profile.user = current_user
    if @profile.save
      redirect_to profile_path(@profile)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    @crag = @profile.crag
    @profile.user = current_user
    if @profile.update(profile_params)
      redirect_to profile_path(@profile)
    else
      render :show, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :bio, :crag_id, :photo)
  end
end
