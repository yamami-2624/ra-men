class Admin::ShopsController < ApplicationController
	def new
    	@shop = Shop.new
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
       @shops = Shop.all
 	end

  def create
   	 # @item = Item.new(item_params)
   	 # @item.save ? (redirect_to admin_item_path(@item)) : (render :new)
   	 @shop = Shop.new(shop_params)
	    if @shop.save!
	      redirect_to admin_shops_path
	    else
	      @shops = Shop.all
	      render :index
	  	end
	end

 	def show
 		@shop = Shop.find(params[:id])
    @raamens = @shop.raamens.all
  end

  def edit
  	@shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])
    @shop.update(shop_params) ? (redirect_to admin_shop_path(@shop)) : (render :edit)
  end

  private
  def shop_params
    params.require(:shop).permit(:name, :address, :phone_number, :business_hours, :number_of_seats, :shop_image_id, :access, :text, :parking)
  end
  	# def ensure_item
   #  	@item = Item.find(params[:id])
   #  end
end
