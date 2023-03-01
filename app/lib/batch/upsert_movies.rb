class Batch::UpsertMovies
  def self.upsert_movies
    require 'themoviedb-api'
    Tmdb::Api.key("2f65e50b9800d29491f553df62f77f95")
    Tmdb::Api.language("ja")
    movieinfo = JSON.parse((Tmdb::Movie.popular).to_json)
    movies = movieinfo['table']['results']
    movies.each do |movie_hash|
      movie = Movie.find_by(title: movie_hash['table']['title'])

      if movie.blank?
        Movie.create!(
          title: movie_hash['table']['title'],
          body: movie_hash['table']['overview'],
          img_url: "https://image.tmdb.org/t/p/w1280#{movie_hash['table']['poster_path']}",
          day: movie_hash['table']['release_date'],
          genre_id: '1')
      end
    end

    require 'themoviedb-api'
    Tmdb::Api.key("2f65e50b9800d29491f553df62f77f95")
    Tmdb::Api.language("ja")
    movieinfo = JSON.parse((Tmdb::Movie.upcoming).to_json)
    movies = movieinfo['table']['results']
    movies.each do |movie_hash|
      movie = Movie.find_by(title: movie_hash['table']['title'])

      if movie.blank?
        Movie.create!(
          title: movie_hash['table']['title'],
          body: movie_hash['table']['overview'],
          img_url: "https://image.tmdb.org/t/p/w1280#{movie_hash['table']['poster_path']}",
          day: movie_hash['table']['release_date'],
          genre_id: '4')
      end
    end


    p "バッチを実行しました"
  end

end