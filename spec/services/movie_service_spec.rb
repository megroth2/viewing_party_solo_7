require "rails_helper"

RSpec.describe MovieService do
  before(:each) do
    @service = MovieService.new
  end

  it "exists" do
    expect(@service).to be_a(MovieService)
  end

  it "returns movie data by keyword", :vcr do
    search = @service.movies_by_keyword("princess")

    expect(search).to be_a(Hash)
    expect(search[:results]).to be_an(Array)

    movie = search[:results].first

    expect(movie).to have_key(:title)
    expect(movie[:title]).to be_a(String)

    expect(movie).to have_key(:vote_average)
    expect(movie[:vote_average]).to be_an(Integer)
  end

  # This test is repeating a lot of the info above - how can I refactor?
  it "returns top rated movies", :vcr do
    search = @service.top_rated_movies
    expect(search).to be_a(Hash)
    expect(search[:results]).to be_an(Array)

    movie = search[:results].first

    expect(movie).to have_key(:title)
    expect(movie[:title]).to be_a(String)

    expect(movie).to have_key(:vote_average)
    expect(movie[:vote_average]).to be_a(Float)
  end
end