class ShopsController < ApplicationController
  	def index
      @shops = Shop.all
   	end

   	def show
 		 @shop = Shop.find(params[:id])
     @reviews = @shop.reviews.order("id DESC").page(params[:page]).per(3)
  	end

  	def top
  		# shop = Shop.find(params[:id])
      @shops = Shop.all
  	end

    def map_search
      @shop = Shop.find(params[:id])
    end

  	def weekly_ranking
      @shop_favorites = Shop.joins(:favorites).where(favorites: {created_at: Time.now.all_week})
      .group(:id).order('count(shop_id) desc').page(params[:page]).per(5)
      @shop_new = Shop.all.order("id DESC").page(params[:page]).per(5)
    end

    def monthly_ranking
      @shop_favorites = Shop.joins(:favorites).where(favorites: {created_at: Time.now.all_month})
      .group(:id).order('count(shop_id) desc').page(params[:page]).per(5)
      @shop_new = Shop.all.order("id DESC").page(params[:page]).per(5)
    end

    def year_ranking
      @shop_favorites = Shop.joins(:favorites).where(favorites: {created_at: Time.now.all_year})
      .group(:id).order('count(shop_id) desc').page(params[:page]).per(5)
      @shop_new = Shop.all.order("id DESC").page(params[:page]).per(5)
    end

    def weekly_tenranking
      @shop_tennsuus = Shop.joins(:reviews).where(reviews: {created_at: Time.now.all_week})
      .group(:id).order('avg(tennsuu) desc').page(params[:page]).per(5)
      @shop_new = Shop.all.order("id DESC").page(params[:page]).per(5)
    end

    def monthly_tenranking
      @shop_tennsuus = Shop.joins(:reviews).where(reviews: {created_at: Time.now.all_month})
      .group(:id).order('avg(tennsuu) desc').page(params[:page]).per(5)
      @shop_new = Shop.all.order("id DESC").page(params[:page]).per(5)
    end

    def year_tenranking
      @shop_tennsuus = Shop.joins(:reviews).where(reviews: {created_at: Time.now.all_year})
      .group(:id).order('avg(tennsuu) desc').page(params[:page]).per(5)
      @shop_new = Shop.all.order("id DESC").page(params[:page]).per(5)
    end

  	def search
      @shop_search = Shop.search(params[:search])
 	  end

   	private
  	def shop_params
  	  params.require(:shop).permit(:name, :address, :phone_number, :business_hours, :number_of_seats, :shop_image, :access, :text, :parking, :latitude, :longitude)
  	end
end
