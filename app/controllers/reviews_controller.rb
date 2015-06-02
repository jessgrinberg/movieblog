class ReviewsController < ApplicationController
	# def create
 #    @movie = Movie.find(params[:movie_id])
 #    @review = @movie.reviews.create(review_params)
 #    @review.user = current_user
 
 #    #@review.user_id =  @current_user.first_name
 #    redirect_to movie_path(@movie)
 #  end

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
