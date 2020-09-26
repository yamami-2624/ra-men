class ShopsController < ApplicationController
	def index
    	@shops = Shop.all
 	end

 	def show
 		@shop = Shop.find(params[:id])
  	end

  	def top
  		# shop = Shop.find(params[:id])
  		@shop = Shop.search(params[:search])
      @shops = Shop.all
  	end

  	def map
      #場所検索
  		# results = Geocoder.search(params[:keyword])
  		# @latlng = results.first.coordinates

  		# respond_to do |format|
    #     	format.js
    #     end
    end

  	def search
    	@shops = Shop.search(params[:keyword])
    	latitude = params[:latitude]
		　longitude = params[:longitude]
		　@places = Shop.all.within(2, origin: [latitude, longitude])
 	end

 	private
	def shop_params
	  params.require(:shop).permit(:name, :address, :phone_number, :business_hours, :number_of_seats, :shop_image_id, :access, :text, :parking, :latitude, :longitude)
	end
end
