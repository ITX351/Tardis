class PlacesController < ApplicationController
	def index
		if params[:search]
			flash[:search] = I18n.t(:search_hint) + params[:search]
			@places = Place.find(:all, :conditions => ['name LIKE ?', "%#{params[:search]}%"])
			@places.each do |place|
				place.hot =  place.hot + 1
				place.save
			end
		elsif params[:classify]
			flash[:classify] = I18n.t(:classifyshowing_hint) + getplaceclassifyname(params[:classify])
			@places = Place.where(:"placeclassify_id" => params[:classify])
		else
			@places = Place.all
		end
		# @places.sort_by! {|a| a.rates}
		@places.sort_by! {|a| a.hot}
		@places.reverse!
		@placeclassify = getplaceclassify
	end

	def new
		@place = Place.new
		@placeclassify = [[I18n.t(:unclassifiedplaces), 0]] + getplaceclassify
	end

	def create
		@place = Place.new(params[:place])
		@place.hot = 0
		if current_user.nil?
			@place.user_id = 1
		else
			@place.user_id = current_user.id
			@place.user = current_user
		end
		if @place.save
			redirect_to @place, :notice => "Submit Successfully!"
		else
			render "new"
		end
	end

	def show
		@place = Place.find(params[:id])
		@placeclassifyname = getplaceclassifyname(@place.placeclassify_id)
	end

	def edit
		@place = Place.find(params[:id])
		@placeclassify = [[I18n.t(:unclassifiedplaces), 0]] + getplaceclassify
		if(@place.user != current_user)
			redirect_to @place, notice: 'You do not have the authority to edit it' 
		end
	end
	
	def update
		@place = Place.find(params[:id])

		respond_to do |format|
			if @place.update_attributes(params[:place])
				format.html { redirect_to @place, notice: 'Place information was successfully updated.' }
				format.json { head :no_content }
			else
				format.html { render action: "edit" }
				format.json { render json: @comment.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@place = Place.find(params[:id])
		if(@place.user != current_user)
			redirect_to @place, notice: 'You do not have the authority to edit it' 
		else
			@place.destroy
			@temp_places = @place.temp_places
			@temp_places.each do |temp_place|
				temp_place.state = -1    # origin has been deleted
				temp_place.state = -1
			end

			@comments = @place.comments
			@comments.each do |comment|
				comment.destroy
			end
			redirect_to :home
		end
	end

	def rate
		@place = Place.find(params[:id])
		@place.rate(params[:stars], current_user, params[:dimension])
		render :update do |page|
			page.replace_html @place.wrapper_dom_id(params), ratings_for(@lace, params.merge(:wrap => false))
			page.visual_effect :highlight, @place.wrapper_dom_id(params)
		end
	end

	def updateapply
		@place = Place.find(params[:id])
		@temp_place = TempPlace.new(name: @place.name, intro: @place.intro, classes: @place.classes,
			locationx: @place.locationx, locationy: @place.locationy, avatar: @place.avatar, avatar_cache: @place.avatar_cache)
	end

	def createtemp
		@place = Place.find(params[:id])
		@temp_place = TempPlace.new(params[:temp_place])
		@temp_place.place_id = params[:id]
		@temp_place.place = @place
		if current_user.nil?
			@temp_place.user_id = 1
		else
			@temp_place.user_id = current_user.id
			@temp_place.user = current_user
		end
		@temp_place.state = 0       # No Accept

		if @temp_place.save
			redirect_to @place
		else
			render "new"
		end
	end
	
	private
		def getplaceclassify # return an Array of Pair(Placeclassify.name1, Placeclassify.id)
			ret = []
			Placeclassify.all.each do |x|
				ret << [x.name1, x.id]
			end
			ret
		end
		def getplaceclassifyname(id) # return name1 of specific ID, and "Unclassified" of 0
			return I18n.t(:unclassifiedplaces) if id == 0 or id == '0'
			Placeclassify.find(id).name1
		end
end
