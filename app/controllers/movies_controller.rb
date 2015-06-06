class MoviesController < ApplicationController
	#before_action :authorized?

	before_action :authorized?, except: :index

	def home
	end

	def index
		@movies = Movie.all
	end

	def show
		@movie = Movie.find(params[:id])
	end

	def new
		@movie = Movie.new
	end

	def create
		@movie = Movie.new(movie_params)
		@movie.user = current_user
		if @movie.save
			redirect_to movies_path
		else
			render :new
		end
	end

	def edit
		@movie = Movie.find(params[:id])  
	end

	def update
		@movie = Movie.find(params[:id])
		if @movie.update_attributes(movie_params)
  			redirect_to movies_path
		else
  			render :edit
		end
	end



		def destroy
		@movie = Movie.find(params[:id])
		@user = Movie.find(params[:id]).user
		if @user == current_user
		@movie.destroy
	end
		redirect_to movies_path
	end



  #  def destroy
  #   @movie = Movie.find(params[:movie_id])

  #   if @movie.user == current_user 
  #       @movie.destroy
  #       flash[:notice] = "Your review has been destroyed."
  #      redirect_to movie_path(@movie)

  #    else
  #     flash[:alert] = ["You cant delete this ."]
  #     redirect_to movie_path(@movie)
      
  #   end
  # end




	private
	def movie_params
		params.require(:movie).permit(:title, :image, :year, :plot)

	end

end
