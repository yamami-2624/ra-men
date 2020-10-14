class Admin::ReviewsController < ApplicationController
  before_action :authenticate_admin!
  
  	def index
      @shop = Shop.find(params[:shop_id])
      raamen = Raamen.find(params[:raamen_id])
      reviews = raamen.review
      @reviews = reviews.all.page(params[:page]).per(5)
 	  end

 	  def show
      @shop = Shop.find(params[:shop_id])
      @review = Review.find(params[:id])
      @raamen = Raamen.find(params[:raamen_id])
  	end

    def destroy
      review = Review.find(params[:id])
      review.destroy!
      redirect_to admin_users_path
    end
end
