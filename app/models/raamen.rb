class Raamen < ApplicationRecord
	belongs_to :shop
	has_many :reviews
	validates :is_active, inclusion: {in: [true, false]}
	attachment :raamen_image

	validates :name, presence: true


	def self.search(search)
    return Raamen.all unless search
    Raamen.where('name LIKE(?)', "%#{search}%")
    end
end
