class Public::MovieCommentsController < ApplicationController
  def create
    movie = Movie.find(params[:movie_id])
    @comment = current_user.movie_comments.new(movie_comment_params)
    @comment.movie_id = movie.id
    @movie_comment = MovieComment.new
    @comment.save
  end

  def destroy
    @comment = MovieComment.find(params[:id])
    @movie_comment = MovieComment.new
    @comment.destroy
  end

  private
  def movie_comment_params
    params.require(:movie_comment).permit(:title, :comment, :comfort)
  end
end
