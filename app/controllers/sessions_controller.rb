class SessionsController < ApplicationController
	def create 
		user = User.find_by(email: params[:login][:email]) 

		if user && user.authenticate(params[:login][:password])
		session[:user_id] = user.id.to_s 
		flash[:notice] = "#{user.first_name} have successfully logged in."
			#redirect_to users_path
			redirect_to root_path
		else
			flash[:notice] = "Please enter your correct information to log in"
			render :new 
		end
	end

	def destroy
		session.delete(:user_id)
    	flash[:notice] = "You have successfully logged out."
		redirect_to root_path
	end

end

