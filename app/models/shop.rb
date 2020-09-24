class Shop < ApplicationRecord
	has_many :raamens
	attachment :shop_image
end