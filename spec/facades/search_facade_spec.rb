require "rails_helper"

RSpec.describe SearchFacade do
  it "exists" do
    facade = SearchFacade.new("princess")

    expect(facade).to be_a(SearchFacade)
    expect(facade.keyword).to eq("princess")
  end

  it "returns movies", :vcr do
    facade = SearchFacade.new("princess")
    results = facade.movie_keyword_search_results(@keyword)
    movie = results.first

    expect(facade.movies).to be_an(Array)
    expect(results).to be_an(Array)
    expect(movie.title).to be_a(String)
    expect(movie.vote_average).to be_an(Integer) # is this supposed to be a string? Is it converted to a string when its made into a poro?
  end
end