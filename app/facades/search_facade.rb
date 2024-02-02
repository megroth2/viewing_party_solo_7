class SearchFacade
  attr_reader :keyword, :movies

  def initialize(keyword)
    @keyword = keyword # this is optional
  end
  
  def movie_keyword_search_results(keyword)
    service = MovieService.new # create a new movie service
    json = service.movies_by_keyword(@keyword) # use the movies_by_keyword method to make an api request and receive parsed json data

    @movies = json[:results].map do |movie_data| # create movie poros and store them in a @movies array
      Movie.new(movie_data)
    end
  end
end