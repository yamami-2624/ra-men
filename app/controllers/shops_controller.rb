class ShopsController < ApplicationController
	def index
    	@shops = Shop.all
 	end

 	def show
 		@shop = Shop.find(params[:id])
  	end

  	def top
  		# shop = Shop.find(params[:id])
      @shops = Shop.all
  	end

  	def ranking
      tennsuu = Shop.joins(:reviews).group(:shop_id).average(:tennsuu)
      shop_ids = Hash[tennsuu.sort_by{ |_, v| -v }].keys
      @shop_ranking = Shop.where(id: shop_ids)

      @shop_new = Shop.all.order("id DESC")
    end

  	def search
      @shops = Shop.search(params[:search])
 	  end

 	private
	def shop_params
	  params.require(:shop).permit(:name, :address, :phone_number, :business_hours, :number_of_seats, :shop_image_id, :access, :text, :parking, :latitude, :longitude)
	end
end
