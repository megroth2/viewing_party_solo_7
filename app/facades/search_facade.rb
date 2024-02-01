class SearchFacade

  def initialize(keyword)
    @keyword = keyword # this is optional
  end
  
  def movies
    service = MoviesService.new
    json = service.movies_by_keyword(keyword)

    @movies = json[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end
end