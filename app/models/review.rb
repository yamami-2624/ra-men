class Review < ApplicationRecord
	belongs_to :user
	belongs_to :raamen
	attachment :review_image
end
