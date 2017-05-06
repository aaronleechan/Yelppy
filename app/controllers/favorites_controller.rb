class FavoritesController < ApplicationController
	
	def new
		@favorites = Favorite.new
	end

	def index
	end

	#since there are no parameters other than the id of the
	#resturant u wanna add, the create method only gets that resturant ID
	def create 
		temp = Favorite.where(:fav_resturant_id => params[:fav_resturant_id], :user_id => params[:user_id])
		if temp.empty?
			@favorites = Favorite.new()
			@favorites.fav_resturant_id = params[:fav_resturant_id]
			@favorites.user_id = params[:user_id]

			if @favorites.save
				redirect_to Resturant.find(@favorites.fav_resturant_id.to_i), notice: "Successfully added to favorites"
			else
				flash[:danger] = "Couldn't add to favorites"
			end
		else
			redirect_to Resturant.find(temp.first.fav_resturant_id), notice: "This resturant is already in you favorites' list"
		end

	end

	def update
	end

	def show
	end

	def edit
	end

end
