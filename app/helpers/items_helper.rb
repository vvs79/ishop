module ItemsHelper
	def set_id(index)
      params[:page].blank? ? index + 1 : ((params[:page]).to_i - 1) * 10 + index + 1
	end

end
