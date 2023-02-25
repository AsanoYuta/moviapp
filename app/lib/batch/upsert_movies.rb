class Batch::UpsertMovies
  def self.upsert_movies
    require 'themoviedb-api'
    Tmdb::Api.key("2f65e50b9800d29491f553df62f77f95")
    Tmdb::Api.language("ja")
    movieinfo = JSON.parse((Tmdb::Movie.popular).to_json)
    movies = movieinfo['table']['results']
    #@movie = movieinfo['table']['results'][params[:id].to_i]["table"]
    movies.each do |movie_hash|
      movie = Movie.find_by(id: movie_hash['id'])
      #byebug
      if movie.blank?
        Movie.create!(
          title: movie_hash['table']['title'],
          body: movie_hash['table']['overview'],
          id: movie_hash['table']['id'],
          img_url: "https://image.tmdb.org/t/p/w1280#{movie_hash['table']['poster_path']}")
      end
    end
    p "バッチを実行しました"
  end
end