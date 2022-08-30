class ReviewsController < ApplicationController
  before_action :set_profile

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.profile = @profile
    if @review.save
      redirect_to profile_path(@profile)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def set_profile
    @profile = Profile.find(params[:profile_id])
  end

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
