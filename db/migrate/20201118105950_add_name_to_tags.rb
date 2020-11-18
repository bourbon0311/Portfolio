class AddNameToTags < ActiveRecord::Migration[5.2]
  def change
    add_column :tags, :name, :string
    add_column :tags, :food_id, :integer
  end
end
