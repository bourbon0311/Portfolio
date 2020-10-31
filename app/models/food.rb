class Food < ApplicationRecord
	belongs_to :user
	has_many :food_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
	def favorited_by?(user)
	   favorites.where(user_id: user.id).exists?
	end
	#バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
	#presence trueは空欄の場合を意味する。
	validates :title, presence: true, length: { in:1..200}
	validates :body, presence: true
end