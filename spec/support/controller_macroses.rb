module ControllerMacros
  
  def self.include(base)
  	base.extend(ClassMethods)
  end

  module ClassMethods

    def it_renders_404_page_when_item_is_not_found(*actions)
      actions.each do |action|
    	  it "#{action} renders 404 page if an item is not found" do
          verb = if action == :update
        	  "PATCH"
          elsif action == :destroy
        	  "DELETE"
          else
        	  "GET"
          end
          process action, verb, { id: 0 }
          response.status.should == 404
    	  end
      end
	  end
  end

end
