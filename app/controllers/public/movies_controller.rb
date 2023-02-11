class Public::MoviesController < ApplicationController
  before_action :authenticate_user!

  before_action :ensure_correct_user, only:[:edit]
  def index
  end

  def edit
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to root_path
    else
      render :new
    end
  end
  private

  def movie_params
    params.require(:movie).permit(:title, :body, :img, :comfort)
  end
end
