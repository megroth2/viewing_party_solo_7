require "rails_helper"

RSpec.describe Movie do
  it "exists" do
    attrs = {
      title: "Aquaman and the Lost Kingdom",
      vote_average: "7"
    }

    movie = Movie.new(attrs)

    expect(movie).to be_a(Movie)
    expect(movie.title).to eq("Aquaman and the Lost Kingdom")
    expect(movie.vote_average).to eq("7")
  end
end