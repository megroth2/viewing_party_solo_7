class MovieService

  def conn
    Faraday.new(url: "https://api.themoviedb.org")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def movies_by_keyword(keyword)
    get_url("/3/discover/movie?with_keywords=#{keyword}&api_key=c8d81118a1c90b7ae7f15b69eea436a7") # Remove API Key
  end

  def top_rated_movies
    get_url("/3/movie/top_rated?api_key=c8d81118a1c90b7ae7f15b69eea436a7") # Remove API Key
  end
end