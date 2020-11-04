class Shop < ApplicationRecord
	geocoded_by :address
	after_validation :geocode, if: :address_changed?
	has_many :raamens, dependent: :destroy
	has_many :reviews, dependent: :destroy
	attachment :shop_image
	has_many :favorites, dependent: :destroy

	validates :name, presence: true
	validates :address, presence: true

	def favorited_by?(user)
    	favorites.where(user_id: user.id).exists?
  	end

	def self.search(search) #self.でクラスメソッドとしている
	    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
	      Shop.where(['name LIKE ?', "%#{search}%"])
	    else
	      Shop.all #全て表示。
	    end
	end

	def self.weekly
		self.joins(:favorites).where(favorites: {created_at: Time.now.all_week}).group(:id).order('count(shop_id) desc')
	end

	def self.pagination
		self.page(params[:page]).per(5)
	end
end
