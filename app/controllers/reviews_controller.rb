class ReviewsController < ApplicationController

 # def index
 #  @reviews = Review.all
 # end

 # def show
 #  @review = Review.find(params[:id])
 # end

 # def new
 #  @review = Review.new
 # end

  #  def edit
  #   @review = Review.find(params[:id])
  #   redirect_to movie_path(Movie.find(params[:movie_id])) #unless @comment.user_id == current_user
  # end

  # def update
  #   review = Review.find(params[:id])
  #   if @review.user == current_user
  #     review.update_attributes(review_params)
  #   else
  #     redirect_to movies_path
  #   end
  # end


 def create
  review = Review.new(review_params)
  movie = Movie.find(params[:movie_id])
  review.user_id = current_user.id
  review.movie = movie

  if review.save
    redirect_to movie_path(movie)
  else
    render :new
  end
end



   def destroy
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.find(params[:id])
    @review.destroy
    redirect_to movie_path(@movie)
  end
 
  private
    def review_params
      params.require(:review).permit(:body, :user_id)
    end
end
