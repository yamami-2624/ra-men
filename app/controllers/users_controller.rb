class UsersController < ApplicationController
	def my_page
		@reviews = current_user.reviews.page(params[:page]).per(5)
	end
end
