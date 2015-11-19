class PlacesController < ApplicationController

	def index
		if params[:search]
			# @places = Place.any_of({name: /#{params[:search]}/i})
			# @places = Place.where(name: /#{params[:search]}/i)
			@places = Place.find(:all, :conditions => ['name LIKE ?', "%#{params[:search]}%"])
		else
			@places = Place.all
		end
	end

	def new
		
	end

	def show
		@place = Place.find(params[:id])
		
	end


end
