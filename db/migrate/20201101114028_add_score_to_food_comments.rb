class AddScoreToFoodComments < ActiveRecord::Migration[5.2]
  def change
    add_column :food_comments, :score, :integer, default: 0
  end
end
