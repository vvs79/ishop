class Item < ActiveRecord::Base
  validates :name, :price, :description, presence: true
  validates :name, length: { maximum: 80 }
  validates :description, length: { maximum: 10000 }
  validates :price, numericality: { greater_than: 0}
  belongs_to :user
  mount_uploaders :avatars, AvatarUploader
  serialize :avatars, Array
end
