class Review < ApplicationRecord
	belongs_to :user
	belongs_to :raamen, optional: true
	belongs_to :shop, optional: true
	attachment :review_image
end
