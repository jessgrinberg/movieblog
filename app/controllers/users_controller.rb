class UsersController < ApplicationController

	#include SessionsHelper
	#note from class today
	# before_action :logged_in? only; :index
	# def index
	# if current_user
	def home
	end

	def index 
		@users = User.all
	end

	 def show
   		 @user = User.find(params[:id])
  	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id.to_s
			redirect_to users_path 
		else
			render :new
		end
	end

	def edit
		@user = User.find(params[:id])

	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
  			redirect_to user_path
		else
  			render :edit
		end

	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to root_path
	end


	private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :avatar, :password, :password_confirmation)
	end
end
