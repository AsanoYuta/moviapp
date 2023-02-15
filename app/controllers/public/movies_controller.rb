class Public::MoviesController < ApplicationController

  before_action :ensure_correct_user, only:[:edit]
  def index
    @movies = Movie.page(params[:page])
  end

  def edit
    @movie = Movie.find(params[:id])
    @user = current_user
  end

  def new
    @movie = Movie.new
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

  def destroy
      @movie = Movie.find(params[:id])
      @movie.destroy
    redirect_to root_path
  end
  private

  def movie_params
    params.require(:movie).permit(:title, :body, :img, :comfort)
  end
  def ensure_correct_user
    @movie = Movie.find(params[:id])
    unless @movie.user_id == current_user.id
      redirect_to movie_path
    end
  end
end