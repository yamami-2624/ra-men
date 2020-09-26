class Shop < ApplicationRecord
	geocoded_by :address
	after_validation :geocode, if: :address_changed?
	has_many :raamens
	has_many :reviews
	attachment :shop_image

	def self.search(search)
	    return Shop.all unless search
	    Shop.where('name LIKE(?)', "%#{search}%")
	end
end