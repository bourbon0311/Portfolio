class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.integer :follower_id
      t.integer :followed_id
      t.integer :following_id
      t.integer :user_id
      t.integer :follow_id

      t.timestamps
    end
  end
end
