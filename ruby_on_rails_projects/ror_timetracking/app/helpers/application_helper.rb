module ApplicationHelper
	def flash_message
		if flash[:notice]
			content_tag :div, class: 'message alert' do
				content_tag :p do
					flash[:notice]
				end
			end
		
		elsif flash[:alert]
			content_tag :div, class: 'message alert' do
				content_tag :p do
					flash[:alert]
				end
			end
		end
	end
end
