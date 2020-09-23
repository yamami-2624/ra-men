class Admin::RaamensController < ApplicationController
	  def new
    	@raamen = Raamen.new
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
       @raamens = Raamens.all
 	  end

  	def create
   	 # @item = Item.new(item_params)
   	 # @item.save ? (redirect_to admin_item_path(@item)) : (render :new)
   	 @raamen = Raamen.new(raamen_params)
      if @raamen.save
        redirect_to admin_raamens_path
      else
        @raamens = Raamens.all
        render :index
    	end
    end

 	def show
 		@raamen = Raamen.find(params[:id])
  	end

  	def edit
  		@raamen = Raamen.find(params[:id])
  	end

  	def update
    	@raamne.update(raamen_params) ? (redirect_to admin_raamnen_path(@raamen)) : (render :edit)
  	end

  	private
  	def raamen_params
    	params.require(:raamen).permit(:genre_id, :review_id, :name, :price, :raamen_image_id, :text, :is_active)
  	end
  	# def ensure_item
   #  	@item = Item.find(params[:id])
   #  end
end
