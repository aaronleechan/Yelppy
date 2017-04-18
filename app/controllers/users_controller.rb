class UsersController < ApplicationController

	def show_profile
		render action: "profile"
	end
end
