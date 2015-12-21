class UsersController < ApplicationController
	def show
			@user = User.find(params[:id])
	end

	def manage
		# @places_pending = TempPlace.find(:all, :conditions => "state" => "0")
		# @places_ac = TempPlace.find(:all, :conditions => "state" => "1")
		@places_ac = TempPlace.where(:state => 1)
		@places_pending = TempPlace.where(:state => 0)
		@temp_places = TempPlace.all

	end

	def auditapply  
		@temp_place = TempPlace.find(params[:id])
	end

	def accepted
		@temp_place = TempPlace.find(params[:id])
		@temp_place.state = 1
		@temp_place.save

		@place = Place.find(@temp_place.place_id)
		@place.update_attributes(name: @temp_place.name, intro: @temp_place.intro, classes: @temp_place.classes,
			locationx: @temp_place.locationx, locationy: @temp_place.locationy, avatar: @temp_place.avatar, avatar_cache: @temp_place.avatar_cache)
		redirect_to manage_path
	end

	def rejected
		@temp_place = TempPlace.find(params[:id])
		@temp_place.state = -2 			# Rejected It
		@temp_place.save
		redirect_to manage_path
	end

	def destroy
		@temp_place = TempPlace.find(params[:id])
		@temp_place.destroy
		redirect_to manage_path
	end
end
