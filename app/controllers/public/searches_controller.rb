class Public::SearchesController < ApplicationController
before_action :authenticate_user!

require 'themoviedb-api'
Tmdb::Api.key("2f65e50b9800d29491f553df62f77f95")
Tmdb::Api.language("ja") # こちらで映画情報の表示の際の言語設定を日本語にできます

def search
 @model = params[:movie]
 @content = params[:content]
 @method = params[:method]
 @model = 'movie'
	@records = Movie.search_for(@content, @method)
end

end
