class ReviewsController < ApplicationController
    def show
      @shop = Shop.find(params[:shop_id])
      @raamen = Raamen.find(params[:raamen_id])
      @review = Review.find(params[:id])
    end
  
  before_action :authenticate_user!
	def new
	    @shop = Shop.find(params[:shop_id])
	    @raamen = Raamen.find(params[:raamen_id])
	    @review = Review.new
    end

  	def index
	    shop = Shop.find(params[:id])
	    review = shop.raamen.review
	    @reviews = review.all.order("id DESC")
 	  end

    def create
      shop = Shop.find(params[:shop_id])
      raamen = Raamen.find(params[:raamen_id])
      review = Review.new(review_params)
      review.shop_id = shop.id
      review.raamen_id = raamen.id
      review.user_id = current_user.id
      if review.save
        redirect_to shop_path(shop)
      else
        @shop = Shop.find(params[:shop_id])
        @raamen = Raamen.find(params[:raamen_id])
        @review = Review.new
        render :new
      end
    end

  	def edit
      @shop = Shop.find(params[:shop_id])
  		@raamen = Raamen.find(params[:raamen_id])
  		@review = Review.find(params[:id])
  	end

  	def update
      shop = Shop.find(params[:shop_id])
      raamen = Raamen.find(params[:raamen_id])
      review = Review.find(params[:id])
    	if review.user_id == current_user.id
        review.update(review_params) ? (redirect_to shop_path(shop)) : (render :edit)
      else
        render :new
      end
    end

    def destroy
      review = Review.find(params[:id])
      if review.user_id == current_user.id
        @shop = Shop.find(params[:shop_id])
        @reviews = @shop.reviews.order("id DESC").page(params[:page]).per(3)
        review.destroy
        render('shops/show')
      else
        @shop = Shop.find(params[:shop_id])
        @reviews = @shop.reviews.order("id DESC").page(params[:page]).per(3)
        render('shops/top')
      end
    end

    def ranking
    end

  	private
  	def review_params
    	params.require(:review).permit(:review, :topping, :tennsuu, :review_image)
  	end
  end

