class Food < ApplicationRecord
	belongs_to :user
	attachment :food_image, destroy: false

    #レビューの点数を表示するメソッド
	has_many :food_comments, dependent: :destroy
	#平均点のメソッド
	def average_score
		unless self.food_comments.empty?
			food_comments.average(:score).round(1).to_f
		else
			0.0
		end
	end

	#
	def review_score_percentage
		unless self.food_comments.empty?
			food_comments.average(:score).round(1).to_f*100/5
		else
			0.0
		end
	end

	has_many :favorites, dependent: :destroy
	def favorited_by?(user)
	   favorites.where(user_id: user.id).exists?
	end
	#バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
	#presence trueは空欄の場合を意味する。
	validates :title, presence: true, length: { in:1..200}
	validates :body, presence: true

end
