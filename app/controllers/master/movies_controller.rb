class Master::MoviesController < ApplicationController
before_action :authenticate_master!

  require 'themoviedb-api'
  Tmdb::Api.key("2f65e50b9800d29491f553df62f77f95")
  Tmdb::Api.language("ja") 

  def index
    @genres = Genre.all
    if params[:genre_id]
      @movies=Movie.where(genre_id: params[:genre_id]).page(params[:page])
    else
      @movies = Movie.page(params[:page])
    end
  end

  def edit
    @movie = Movie.find(params[:id])
    @user = current_master
    @genres = Genre.all
  end

  def new
    @movie = Movie.new
    @genres = Genre.all
  end

  def show
    @movie = Movie.find(params[:id])
    @movie_comment = MovieComment.new
    @genres = Genre.all
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.user_id = current_master.id
    if @movie.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.user_id = current_master.id
    if @movie.update(movie_params)
    flash[:notice] = "編集が完了しました。"
       redirect_to movie_path(@movie.id)
    else
       render :edit
    end
  end

  def destroy
      @movie = Movie.find(params[:id])
      @movie.destroy
    redirect_to root_path
  end
  private

  def movie_params
    params.require(:movie).permit(:title, :body, :img, :comfort)
  end
end
