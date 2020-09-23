class Raamen < ApplicationRecord
	belongs_to :genre
	has_many :shops
	belongs_to :review
	validates :is_active, inclusion: {in: [true, false]}
	attachment :raamen_image
end
