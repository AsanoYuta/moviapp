class Master::MoviesController < ApplicationController
before_action :authenticate_master!

  def index
    @genres = Genre.all
    @total_count = Movie.all.count
    @movie_comment = MovieComment.new
    if params[:genre_id]
      @movies = Movie.where(genre_id: params[:genre_id]).page(params[:page]).per(100)
    else
      @movies = Movie.page(params[:page]).per(100)
    end
  end

  def show
    @user = current_user
    @movie = Movie.find(params[:id])
    #byebug
    @movie_comment = MovieComment.new
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :body, :img, :comfort)
  end
end
