class FoodComment < ApplicationRecord
	belongs_to :user
	belongs_to :food

	validates :comment, presence: true
end
