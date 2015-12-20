class PlacesController < ApplicationController
	def index
		if params[:search]
			@places = Place.find(:all, :conditions => ['name LIKE ?', "%#{params[:search]}%"])
			@places.each do |place|
				place.hot =  place.hot + 1
				place.save
			end
		else
			@places = Place.all
		end
		# @places.sort_by! {|a| a.rates}
		@places.sort_by! {|a| a.hot}
		@places.reverse!
	end

	def new
		@place = Place.new
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
			redirect_to @place
		else
			render "new"
		end
	end

	def show
		@place = Place.find(params[:id])
	end

	def edit
    		@place = Place.find(params[:id])
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
end
