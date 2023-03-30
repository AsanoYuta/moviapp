class Public::HomesController < ApplicationController

  def top
    @movies = Movie.page(params[:page]).per(100)
  end

end
