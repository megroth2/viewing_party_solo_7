class MovieService

  def conn # set up a new api connection
    Faraday.new(url: "https://api.themoviedb.org")
  end

  def get_url(url) # make a request, passing in the url
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def movies_by_keyword(keyword)
    get_url("/3/discover/movie?with_keywords=#{keyword}&api_key=#{Rails.application.credentials.tmdb[:key]}")
  end

  def top_rated_movies
    get_url("/3/movie/top_rated?api_key=#{Rails.application.credentials.tmdb[:key]}")
  end
end