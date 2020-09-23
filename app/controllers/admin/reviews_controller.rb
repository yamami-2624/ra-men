class Admin::ReviewsController < ApplicationController
	def new
    	@review = Review.new
    end

  	def index
	   #  if params[:genre_id]
	   #    @genre = Genre.find(params[:genre_id])
	   #    all_items = @genre.items
    # else
    #   	all_items = Item.includes(:genre)
    # end
	   #  @items = all_items.page(params[:page])
	   #  @all_items_count = all_items.count
       @reviews = Reviews.all
 	 end

 	def show
 		@review = Review.find(params[:id])
  	end

  	def update
    	@review.update(review_params) ? (redirect_to admin_review_path(@review)) : (render :edit)
  	end
end
