require "rails_helper"

RSpec.describe MovieService do
  it "returns movie data by keyword", :vcr do
    search = MovieService.new.movies_by_keyword("princess")
    expect(search).to be_a(Hash)
    expect(search[:results]).to be_an(Array)

    movie = search[:results].first

    expect(movie).to have_key(:title)
    expect(movie[:title]).to be_a(String)

    expect(movie).to have_key(:vote_average)
    expect(movie[:vote_average]).to be_an(Integer)
  end
end