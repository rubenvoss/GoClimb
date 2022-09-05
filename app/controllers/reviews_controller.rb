class ReviewsController < ApplicationController
  before_action :set_profile, only: %i[new create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.profile = @profile
    @review.user = current_user
    if @review.save
      redirect_to profile_path(@profile)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to profile_path(@review.profile), status: :see_other
  end

  private

  def set_profile
    @profile = Profile.find(params[:profile_id])
  end

  def review_params
    params.require(:review).permit(:comment)
  end
end
