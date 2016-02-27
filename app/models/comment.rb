class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :commantable, polymorphic: true
end
