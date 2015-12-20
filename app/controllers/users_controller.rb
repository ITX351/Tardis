class UsersController < ApplicationController
	def show
	  	@user = User.find(params[:id])
	end

	def manage
		# @places_pending = TempPlace.find(:all, :conditions => "state" => "0")
		# @places_ac = TempPlace.find(:all, :conditions => "state" => "1")
		@places_ac = TempPlace.where(:state => 1)
		@places_pending = TempPlace.where(:state => 0)

	end

	def auditapply	
		@temp_place = TempPlace.find(params[:id])
	end

	def accepted
		@temp_place = TempPlace.find(params[:id])
		@temp_place.state = 1
		@temp_place.save

		
		@place = Place.find(@temp_place.place_id)

		redirect_to @place
	end

end
