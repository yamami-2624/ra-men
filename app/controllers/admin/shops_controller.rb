class Admin::ShopsController < ApplicationController
	def new
    @shop = Shop.new
  end

  def index
    @shops = Shop.all
 	end

  def create
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
    params.require(:shop).permit(:name, :address, :phone_number, :business_hours, :number_of_seats, :shop_image_id, :access, :text, :parking, :latitude, :longitude)
  end
end
