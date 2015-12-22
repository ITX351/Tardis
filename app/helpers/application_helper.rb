module ApplicationHelper
	def full_title(page_title)
			return "Tardis" if page_title.empty?
			page_title
	end
	def find_user(user_id)
		return User.find(user_id)
	end
	
	def find_place(place_id)
		return Place.find(place_id)
	end

	def find_temp_place(temp_place_id)
		return TempPlace.find(temp_place_id)
	end

	def link_back
			# view<%= link_back %>
			link_to "<Go Back", request.env["HTTP_REFERER"].blank? ? "/" : request.env["HTTP_REFERER"], :method => :get
	end
end
