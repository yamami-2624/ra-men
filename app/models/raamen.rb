class Raamen < ApplicationRecord
	belongs_to :shop
	has_many :reviews
	validates :is_active, inclusion: {in: [true, false]}
	attachment :raamen_image
end
