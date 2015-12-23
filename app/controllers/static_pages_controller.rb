class StaticPagesController < ApplicationController
	def home
		@places = Place.all
		@places.sort_by! {|a|	a.hot}
		@places.reverse!
		@notices = Notice.all
	end

	def notice
		@notices = Notice.all
	end
	def help
	end

	def about
	end
end
