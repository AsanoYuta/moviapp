class Public::MoviesController < ApplicationController

  before_action :ensure_correct_user, only:[:edit]

  require 'themoviedb-api'
  Tmdb::Api.key("2f65e50b9800d29491f553df62f77f95")
  Tmdb::Api.language("ja") # こちらで映画情報の表示の際の言語設定を日本語にできます

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

  def edit
    @movie = Movie.find(params[:id])
    @user = current_user
    @genres = Genre.all
  end

  def new
    @movie = Movie.new
    @genres = Genre.all
  end

  def show
    @movie = Movie.find(params[:id])
    @movie_comment = MovieComment.new


  end

  def create
    @movie = Movie.new(movie_params)
    @movie.user_id = current_user.id
    if @movie.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.user_id = current_user.id
    if @movie.update(movie_params)
    flash[:notice] = "編集が完了しました。"
       redirect_to movie_path(@movie.id)
    else
       render :edit
    end
  end

   private

  def movie_params
    params.require(:movie).permit(:title, :body, :img, :comfort)
  end
end