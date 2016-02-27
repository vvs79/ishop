class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.integer :cart_id
      t.integer :user_id
      t.integer :quantity
      t.timestamps null: false
    end
  end
end
