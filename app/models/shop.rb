class Shop < ApplicationRecord
	belongs_to :raamen, optional: true
	attachment :shop_image
end
