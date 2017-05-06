class UsersController < ApplicationController

	def show_profile
		@my_review_resturant = Array.new
		@my_favorites = Array.new
		initialize_my_resturants
		initialize_favorites
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

	def initialize_favorites
		my_id = current_user.id.to_i
		t1 = Favorite.where(:user_id => my_id)
		
		t1.each do |fav|
			t2 = Resturant.where(:id => fav.fav_resturant_id)
			@my_favorites = @my_favorites + t2
		end
	end

	def add_to_favorites
		my_id = current_user.id.to_i
		if user_signed_in?
			temp = Favorite.new
			redirect_to create_favorite_path(:fav_resturant_id => params[:fav_resturant_id], :user_id => my_id)
		else
			#redirect_to log_in_url, :notice=>"You must be logged in to view that page."	
		end
	end

end
