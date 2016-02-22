class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string  :name
      t.float   :price
    	t.string  :description
      t.integer :user_id
    	t.integer :votes_count, default: 0
      t.timestamps null: false
    end
    add_index :items, :price
    add_index :items, :name
  end
end
