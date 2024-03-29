class Master::GenresController < ApplicationController
before_action :authenticate_master!

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def edit
    @genre = Genre.find(params[:id])
  end
  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to master_genres_path
    else
      render :index
    end
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
    flash[:notice] = "編集が完了しました。"
       redirect_to master_genres_path
    else
       render :edit
    end
  end

  def destroy
      @genre = Genre.find(params[:id])
      @genre.destroy
    redirect_to master_genres_path
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
