class Public::MoviesController < ApplicationController
  before_action :ensure_correct_user, only:[:edit]

  def index
    @genres = Genre.all
    @total_count = Movie.all.count
    @movie_comments = MovieComment.all
    if params[:genre_id]
      @movies = Movie.where(genre_id: params[:genre_id]).page(params[:page]).per(100)
    else
      @movies = Movie.page(params[:page]).per(100)
    end
  end

  def show
    @movie = Movie.find(params[:id])
    @movie_comment = MovieComment.new
  end

   private

  def movie_params
    params.require(:movie).permit(:title, :body, :img, :comfort)
  end

end