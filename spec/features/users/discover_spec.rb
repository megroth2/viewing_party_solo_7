require 'rails_helper'

RSpec.describe 'Discover Movies: Search By Title', type: :feature do

  before(:each) do
    @user_1 = User.create!(name: 'Tommy', email: 'tommy@email.com')
    # @user_2 = User.create!(name: 'Sam', email: 'sam@email.com')
    visit "/users/#{@user_1.id}/discover"
  end

  describe '1. Discover Movies: Search by Title', :vcr do
    # As a user,
    # When I visit the '/users/:id/discover' path (where :id is the id of a valid user),
    # I should see
    # - a button to Discover Top Rated Movies
    # - a text field to enter keyword(s) to search by movie title
    # - a button to Search by Movie Title
    
    it "displays an error message if the id provided doesn't match a valid user" do
      visit "/users/5/discover"

      expect(page).to have_content("Error:")

      visit "/users/#{@user_1.id}/discover"

      expect(page).to_not have_content("Error:")
    end

    it "displays a button to Discover Top Rated Movies" do
      expect(page).to have_button("Discover Top Rated Movies")
    end

    it "displays a text field to enter keyword(s) to search by movie title" do
      expect(page).to have_content("Enter keyword(s)")
    end

    it "displays a button to Search by Movie Title" do
      expect(page).to have_button("Search by Movie Title")
    end
  end

  describe "2. Movie Results Page", :vcr do
    # When I visit the discover movies page ('/users/:id/discover'),
    # and click on either the Discover Top Rated Movies button or fill out the movie title search and click the Search button,
    # I should be taken to the movies results page (`users/:user_id/movies`) where I see: 
    # - Title (As a Link to the Movie Details page (see story #3))
    # - Vote Average of the movie
    # I should also see a button to return to the Discover Page.

    xit "can redirect to the movies results page from the Discover Top Rated Movies button" do
      click_button("Discover Top Rated Movies")

      # expect(page.status_code).to eq(200)
      expect(current_path).to eq("/users/#{@user_1.id}/movies")
    end

    xit "can redirect to the movies results page from the Search by Movie Title button" do
      fill_in(:search, with: "princess")
      click_button("Search by Movie Title")

      # expect(page.status_code).to eq(200)
      expect(current_path).to eq("/users/#{@user_1.id}/movies")
    end
  end
end