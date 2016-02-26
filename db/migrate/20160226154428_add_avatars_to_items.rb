class AddAvatarsToItems < ActiveRecord::Migration
  def change
    add_column :items, :avatars, :text
  end
end
