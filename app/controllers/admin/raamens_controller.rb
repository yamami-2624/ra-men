class Admin::RaamensController < ApplicationController
	  def new
      @shop = Shop.find(params[:shop_id])
    	@raamen = Raamen.new
    end

  	def index
      shop = Shop.find(params[:id])
      raamens = shop.raamen
      @raamens = raamens.all
 	  end

    def create
      shop = Shop.find(params[:shop_id])
      raamen = Raamen.new(raamen_params)
      raamen.shop_id = shop.id
      if raamen.save!
        redirect_to admin_shop_path(shop)
      else
        render :new
      end
    end

 	  def show
      @shop = Shop.find(params[:shop_id])
 		  @raamen = Raamen.find(params[:id])
  	end

  	def edit
      @shop = Shop.find(params[:shop_id])
  		@raamen = Raamen.find(params[:id])
  	end

  	def update
      shop = Shop.find(params[:shop_id])
      @raamen = Raamen.find(params[:id])
    	@raamen.update(raamen_params) ? (redirect_to admin_shop_path(shop)) : (render :edit)
  	end

  	private
  	def raamen_params
    	params.require(:raamen).permit(:shop_id, :aji, :dashi, :review_id, :name, :price, :raamen_image_id, :text, :is_active)
  	end
  	# def ensure_item
   #  	@item = Item.find(params[:id])
   #  end
end
