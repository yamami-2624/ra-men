class ReviewsController < ApplicationController
	def new
	    @shop = Shop.find(params[:shop_id])
	    @raamen = Raamen.find(params[:raamen_id])
	    @review = Review.new
    end

  	def index
	    shop = Shop.find(params[:id])
	    review = shop.raamen.review
	    @reviews = review.all
 	  end

    def create
      shop = Shop.find(params[:shop_id])
      raamen = Raamen.find(params[:raamen_id])
      review = Review.new(review_params)
      review.shop_id = shop.id
      review.raamen_id = raamen.id
      if review.save!
        redirect_to shop_path(shop)
      else
        render :new
      end
    end

 	  def show
   		@raamen = Raamen.find(params[:raamen_id])
   		@review = Review.find(params[:id])
  	end

  	def edit
      @shop = Shop.find(params[:shop_id])
  		@raamen = Raamen.find(params[:raamen_id])
  		@review = Review.find(params[:id])
  	end

  	def update
      shop = Shop.find(params[:shop_id])
      @raamen = Raamen.find(params[:id])
    	@raamen.update(raamen_params) ? (redirect_to admin_shop_path(shop)) : (render :edit)
  	end

    def ranking
    end

  	private
  	def review_params
    	params.require(:review).permit(:review, :topping, :tennsuu, :review_image_id)
  	end
  end

