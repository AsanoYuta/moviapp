class Public::HomesController < ApplicationController
  require 'themoviedb-api'
  Tmdb::Api.key("2f65e50b9800d29491f553df62f77f95")
  Tmdb::Api.language("ja")

  def top
    @movies = Movie.page(params[:page]).per(100)
  end

  def about
  end
end
