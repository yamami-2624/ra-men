class RaamensController < ApplicationController
	def index
    	@shop = Shop.find(params[:shop_id])
    	raamens = @shop.raamens
    	@raamens = raamens.all
 	end

 	def search
 		@shop = Shop.find(params[:shop_id])
    	@raamens = Raamen.search(params[:keyword])
    end
end
