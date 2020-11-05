class AddContentToFoodComment < ActiveRecord::Migration[5.2]
  def change
    add_column :food_comments, :content, :string
  end
end
