class FavoritesController < ApplicationController
	def create
		shop = Shop.find(params[:shop_id])
		favorite.shop_id = shop.id
		favorite.user_id = current_user.id
	    favorite = favorites.new(favorites_params)
	    favorite.save
	    redirect_to shop_path(shop)
	end

	def destroy
		shop = Shop.find(params[:shop_id])
		favorite.shop_id = shop.id
		favorite.user_id = current_user.id
	    favorite = favorites.find_by(favorites_params)
	    favorite.destroy
	    redirect_to shop_path(shop)
	end
end