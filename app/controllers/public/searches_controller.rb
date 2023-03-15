class Public::SearchesController < ApplicationController
 before_action :authenticate_user!

 def search
  @content = params[:content]
  @model = 'movie'
 	@records = Movie.search_for(@content, @method)
 end

end
