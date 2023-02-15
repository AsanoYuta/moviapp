class Public::FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create

    @movie = Movie.find(params[:movie_id])
    favorite = @movie.favorites.new(user_id: current_user.id)
    favorite.save

  end

  def destroy

    @movie = Movie.find(params[:movie_id])
    favorite = @movie.favorites.find_by(user_id: current_user.id)
    favorite.destroy

  end

end
