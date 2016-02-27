class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :user_id
      t.integer :commantable_id
      t.integer :commantable_type # Item, BlogPost
      t.timestamps null: false
    end
  end
end
