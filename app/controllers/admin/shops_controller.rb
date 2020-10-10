class Admin::ShopsController < ApplicationController
  before_action :authenticate_admin!
  
	def new
    @shop = Shop.new
  end

  def index
    @shops = Shop.all.page(params[:page]).per(20)
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
    @raamens = @shop.raamens.all.page(params[:page]).per(5)
  end

  def edit
  	@shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])
    @shop.update(shop_params) ? (redirect_to admin_shop_path(@shop)) : (render :edit)
  end

  def destroy
    @shop = Shop.find(params[:id])
    @shop.destroy!
    flash[:notice] = '店舗を削除しました'
    redirect_to admin_shops_path
  end

  private
  def shop_params
    params.require(:shop).permit(:name, :address, :phone_number, :business_hours, :number_of_seats, :shop_image_id, :access, :text, :parking, :latitude, :longitude)
  end
end
