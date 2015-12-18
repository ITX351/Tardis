class SessionsController < ApplicationController
	def new
		if signed_in? 
			redirect_to :home 
		end
	end

	def create
		user = User.find_by_name(params[:session][:name]) #downcase 
		#flash.now[:username] = params[:session][:name] 
		#flash.now[:password] = params[:session][:password]
		if user && user.authenticate(params[:session][:password])
		 	sign_in user
		 	flash.now[:hint] = "Welcome!"
		 	#redirect_to user
		 	redirect_to :home
		else
			flash.now[:hint] = "Invalid username or password!"
			render 'new'
		end
	end

	def destroy 
		sign_out
		redirect_to signin_path
	end
end
