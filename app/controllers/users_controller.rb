class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
	end

	def manage
		if (current_user.nil? )
			redirect_to  '/signin'
		elsif (current_user.authority  != 1)
			redirect_to current_user, :notice => 'You do not have the authority to edit it' 
		else 
			@places_ac = TempPlace.where(:state => 1)
			@places_pending = TempPlace.where(:state => 0)
			@temp_places = TempPlace.all
		end
	end

	def auditapply	
		@temp_place = TempPlace.find(params[:id])
		@temp_placeclassifyname = getplaceclassifyname(@temp_place.classes)
	end

	def accepted
		@temp_place = TempPlace.find(params[:id])
		@temp_place.state = 1

		if(@temp_place.applytype == 0)
			# update apply
			@temp_place.save
			@place = Place.find(@temp_place.place_id)
			@place.update_attributes(name: @temp_place.name, intro: @temp_place.intro, placeclassify_id: @temp_place.classes,
				locationx: @temp_place.locationx, locationy: @temp_place.locationy, avatar: @temp_place.avatar, avatar_cache: @temp_place.avatar_cache)
		else
			# new apply
			@place = Place.new(name: @temp_place.name, intro: @temp_place.intro, placeclassify_id: @temp_place.classes,
				locationx: @temp_place.locationx, locationy: @temp_place.locationy, avatar: @temp_place.avatar, avatar_cache: @temp_place.avatar_cache)
			@place.hot = 0
			@temp_place.place = @place
			@temp_place.place_id = @place.id
			@temp_place.save

			@place.user_id = @temp_place.user_id
			@place.user = @temp_place.user
			@place.save
		end
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

private
	def getplaceclassifyname(id) # return name1 of specific ID, and "Unclassified" of 0
		return I18n.t(:unclassifiedplaces) if id == 0 or id == '0'
		Placeclassify.find(id).name1
	end
end
