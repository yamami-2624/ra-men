class Shop < ApplicationRecord
	geocoded_by :address
	after_validation :geocode, if: :address_changed?
	has_many :raamens, dependent: :destroy
	has_many :reviews, dependent: :destroy
	attachment :shop_image
	has_many :favorites, dependent: :destroy

	def favorited_by?(user)
    	favorites.where(user_id: user.id).exists?
  	end

	def self.search(search)
	    return Shop.all unless search
	    Shop.where('name LIKE(?)', "%#{search}%")
	end
end