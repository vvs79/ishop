class ItemsMailer < ApplicationMailer

	default from: "info@ishop.com",
          template_path: 'mailers/items'

	def item_destroyed(item)
		@item = item
		mail to: 'vidoc1979@gmail.com',
		     subject: "Item destroyed"
	end

end
