class ReviewsController < ApplicationController
  before_action :set_resturant
  before_action :authenticate_user!

  def new
    @review = Review.new(resturant: @resturant)
  end

  def create
    @review = current_user.reviews.build(review_params)
    @review.resturant = @resturant
    @review.save
    redirect_to @resturant
  end


  private

  def set_resturant
    @resturant = Resturant.find(params[:resturant_id])
  end

  def review_params
    params.require(:review).permit(:comment, :rating)
  end


end