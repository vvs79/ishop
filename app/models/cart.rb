class Cart < ActiveRecord::Base
	belongs_to :user
	has_many :items, through: :positions
	has_many :positions
end
