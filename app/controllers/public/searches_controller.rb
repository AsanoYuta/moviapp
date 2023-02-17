class Public::SearchesController < ApplicationController
before_action :authenticate_user!

def search
 @model = params[:movie]
 @content = params[:content]
 @method = params[:method]
 @model = 'movie'
	@records = Movie.search_for(@content, @method)
end

end
