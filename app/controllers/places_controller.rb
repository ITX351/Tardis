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
		@place = Place.new
	end
	def create
		@place = Place.new(params[:place])
		if @place.save
			redirect_to @place
		else
			render "new"
		end
	end

	def show
		@place = Place.find(params[:id])
		
	end

	def destroy
		@place = Place.find(params[:id])
    	@place.destroy

    	respond_to do |format|
	      format.html { redirect_to places_url }
	      format.json { head :no_content }
    end
	end


end
