require "rails_helper"

RSpec.describe SearchFacade do
  it "exists" do
    facade = SearchFacade.new("princess")

    expect(facade).to be_a(SearchFacade)
    expect(facade.keyword).to eq("princess")
  end

  xit "returns movies", :vcr do
    facade = SearchFacade.new("princess")
    results = facade.movie_keyword_search_results(facade.keyword)
    movie = results.first

    expect(facade.movies).to be_an(Array)
    expect(results).to be_an(Array)
    expect(movie.title).to be_a(String)
    expect(movie.vote_average).to be_an(Integer) # will this error out if its a float?
  end

  xit "converts movies to poros", :vcr do
    facade = SearchFacade.new("princess")
    results = facade.movie_keyword_search_results(facade.keyword)

    expect(facade.movies).to be_an(Array)
    expect(facade.movies.count).to eq(20)
    expect(facade.movies.first.title).to be_a(String)
    expect(facade.movies.first.vote_average).to be_an(Integer) # will this error out if its a float?
  end
end