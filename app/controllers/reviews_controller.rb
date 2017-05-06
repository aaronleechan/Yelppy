class ReviewsController < ApplicationController
  before_action :set_resturant
  before_action :authenticate_user!

  def new
    # check if user has already added a review for this restaurant:

    # NOTE: "begin"/"rescue" are like try/catch:
    begin
      # this first line throws an error if no review exists by this user for this restaurant (is therefore the user's first comment)
      # if an error is thrown, that means the user hasn't entered a comment yet, so let them add a comment (jump to "rescue"):
      @existing_review = Review.find_by_user_id_and_resturant_id(current_user.id, params[:resturant_id])

      # if continue, user has already added a comment before, so warn them that they can't add another comment:
      flash[:danger] = "You can only add 1 comment per restaurant. You already commented: \"" + @existing_review.comment + "\""
      redirect_to @resturant
    rescue
      # an error was thrown (user hasn't added a comment yet), so lest them add a comment:
      @review = Review.new(resturant: @resturant)
    end

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