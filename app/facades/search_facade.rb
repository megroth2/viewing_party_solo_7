class SearchFacade
  attr_reader :keyword, :movies

  def initialize(keyword)
    @keyword = keyword # this is optional
  end
  
  def movie_keyword_search_results(keyword)
    service = MovieService.new # create a new movie service
    json = service.movies_by_keyword(@keyword) # use the movies_by_keyword method in the service to make an api request

    @movies = json[:results].map do |movie_data| # create movie poros using the json response data and store them in a @movies array
      Movie.new(movie_data)
    end
  end

  def top_rated_movies
    service = MovieService.new
    json = service.top_rated_movies

    @movies = json[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end
end