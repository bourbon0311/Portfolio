class AddFoodImageIdToFoods < ActiveRecord::Migration[5.2]
  def change
    add_column :foods, :food_image_id, :string
  end
end
