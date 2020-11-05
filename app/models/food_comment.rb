class FoodComment < ApplicationRecord
	belongs_to :user
	belongs_to :food
	attachment :post_image, destroy: false

	validates :score, presence: true
end
