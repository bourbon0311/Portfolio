class ChangeDataPostImageIdToFoodComments < ActiveRecord::Migration[5.2]
  def change
  	change_column :food_comments, :post_image_id, :string
  end
end
