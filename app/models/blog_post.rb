class BlogPost < ActiveRecord::Base

	has_many :comments, as: :commantable

end
