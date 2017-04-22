class UsersController < ApplicationController

	def show_profile
		@my_review_resturant = Array.new
		initialize_my_resturants
		render action: "profile"
	end

	def initialize_my_resturants
		my_id = current_user.id.to_i
		@my_reviews = Review.where(:user_id => current_user.id)
		#@my_review_resturant = Resturant.where(:id => @my_reviews.resturant_id)
		@my_reviews.each do |rev|
			temp_res = Resturant.where(:id => rev.resturant_id)
			@my_review_resturant = @my_review_resturant + temp_res
		end
	end

	def add_to_favorites

	end

end
