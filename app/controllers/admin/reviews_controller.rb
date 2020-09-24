class Admin::ReviewsController < ApplicationController

  	def index
      @shop = Shop.find(params[:shop_id])
      raamen = Raamen.find(params[:raamen_id])
      reviews = raamen.review
      @reviews = reviews.all
 	  end

 	  def show
      @shop = Shop.find(params[:shop_id])
      @review = Review.find(params[:id])
      @raamen = Raamen.find(params[:raamen_id])
  	end

    def destroy
      @shop = Shop.find(params[:shop_id])
      @raamen = Raamen.find(params[:raamen_id])
      review = review.find_by(id: params[:id], shop_id: @shop,id, raamen_id: @raamen,id)
      review.destroy
      redirect_to request.referer
    end

   #  def 

  	# def update
   #  	@review.update(review_params) ? (redirect_to admin_review_path(@review)) : (render :edit)
  	# end
end
