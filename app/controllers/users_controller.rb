class UsersController < ApplicationController
  def show_profile
	  @my_review_resturant = Array.new
    @reviewer = User.find(params[:reviewer])
	  initialize_my_resturants(params[:reviewer])
	  render action: "profile"
  end

	def initialize_my_resturants(user_id)
		my_id = user_id.to_i
		@my_reviews = Review.where(:user_id => current_user.id)
		#@my_review_resturant = Resturant.where(:id => @my_reviews.resturant_id)
		@my_reviews.each do |rev|
			temp_res = Resturant.where(:id => rev.resturant_id)
			@my_review_resturant = @my_review_resturant + temp_res
		end
	end

	def add_to_favorites

  end

  def send_message
    @sender = current_user
    @receiver = User.find(params[:reviewer])

	end

	def send_to_reviewer
		UserMailer.message_to_reviewer(params[:sender], params[:receiver], params[:subject], params[:body]).deliver
		redirect_to root_path
	end

end
