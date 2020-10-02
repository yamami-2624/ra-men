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
      shop = Shop.joins(:reviews)
      average = shop.group(:id).average(:tennsuu)
      @shop_rankings = shop.group(:id).order('average desc')
      # .paginate(page: params[:page], per_page: 10)

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
