class Public::MovieCommentsController < ApplicationController
  def create
    movie = Movie.find(params[:movie_id])
    @comment = current_user.movie_comments.new(movie_comment_params)
    @comment.movie_id = movie.id
    @comment.save
  end

  def destroy
    @comment = MovieComment.find(params[:id])
    @comment.destroy
  end

  private
  def movie_comment_params
    params.require(:movie_comment).permit(:comment)
  end
end
