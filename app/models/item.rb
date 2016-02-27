class Item < ActiveRecord::Base
  validates :name, :price, :description, presence: true
  validates :name, length: { maximum: 80 }
  validates :description, length: { maximum: 10000 }
  validates :price, numericality: { greater_than: 0, allow_nil: true}
  
  belongs_to :user
  has_many :carts, through: :positions
  has_many :positions
  has_many :comments, as: :commantable
  
  mount_uploaders :avatars, AvatarUploader
  serialize :avatars, Array
end
