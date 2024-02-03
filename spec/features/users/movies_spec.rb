require 'rails_helper'

RSpec.describe 'Discover Movies: Search By Title', type: :feature do

  before(:each) do
    @user_1 = User.create!(name: 'Tommy', email: 'tommy@email.com')
    # @user_2 = User.create!(name: 'Sam', email: 'sam@email.com')
    visit "/users/#{@user_1.id}/movies"
  end

  describe "2. Movie Results Page", :vcr do
    # cont...
    # I should be taken to the movies results page (`users/:user_id/movies`) where I see: 
    # - Title (As a Link to the Movie Details page (see story #3))
    # - Vote Average of the movie
    # I should also see a button to return to the Discover Page.

    xit "can display top rated movies" do
      expect(page).to have_content("The Shawshank Redemption")
      expect(page).to have_content("Vote Average: 8.711")
    end

    xit "can display keyword search results" do
      visit "/users/#{@user_1.id}/discover"

      fill_in(:search, with: "princess") # this is already tested in discover_spec.rb
      click_button("Search by Movie Title") # this is already tested in discover_spec.rb

      expect(page.status_code).to eq(200) # this is already tested in discover_spec.rb
      expect(current_path).to eq("/users/#{@user_1.id}/movies") # this is already tested in discover_spec.rb
      expect(page).to have_content("The Princess")
      expect(page).to have_content("Vote Average: 7.8")
    end

    xit "has a button that returns to the Discover Page" do
      visit "/users/#{@user_1.id}/movies"

      expect(page).to have_button("Discover Page")

      click_button("Discover Page")

      expect(current_path).to eq("/users/#{@user_1.id}/discover")
    end
  end
end