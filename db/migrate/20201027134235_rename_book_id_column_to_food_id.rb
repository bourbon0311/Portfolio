class RenameBookIdColumnToFoodId < ActiveRecord::Migration[5.2]
  def change
  	rename_column :favorites, :book_id, :food_id
  end
end
