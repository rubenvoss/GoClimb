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

    if profile_params[:crag_id].nil?
      @profile.crag = Crag.find(profile_params[:crag_id])
    end

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
    @profile.update(profile_params)

    respond_to do |format|
      format.html { redirect_to profile_path(@profile) }
      format.text { render partial: "profiles/profile_infos", locals: {profile: @profile}, formats: [:html] }
    end
  end

  def destroy
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :bio, :crag_id, :photo, :age)
  end
end
