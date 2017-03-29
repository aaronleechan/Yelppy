class ResturantsController < ApplicationController
	before_action :authenticate_user!,only:[:create,:new]

	def index
		@resturants = Resturant.all
	end

	def new
		@resturant = Resturant.new
	end

	def create
		@resturant = Resturant.new(resturant_params)
		if @resturant.save
				redirect_to @resturant
		else
			flash[:danger] = @resturant.errors.full_messages.to_sentence
			render 'new'
		end
	end

	def show
		@resturant = Resturant.find(params[:id])
		@reviews = Review.where(resturant_id: @resturant)
		if @reviews.blank?
			@avg_rating = 0
		else
			@avg_rating = @reviews.average(:rating).round(2)
		end
	end

	private
	def resturant_params
		params.require(:resturant).permit(:name,  :description, :category_id, :address1, :address2, :city,
																			:state, :zipcode, :phone, :email);
	end
end
