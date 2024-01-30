require 'rails_helper'

RSpec.describe 'Discover Movies: Search By Title', type: :feature do

  before(:each) do
    # @user_1 = User.create!(name: 'Tommy', email: 'tommy@email.com')
    # @user_2 = User.create!(name: 'Sam', email: 'sam@email.com')
  end

  describe '1. Discover Movies: Search by Title' do
    # As a user,
    # When I visit the '/users/:id/discover' path (where :id is the id of a valid user),
    # I should see
    # - a button to Discover Top Rated Movies
    # - a text field to enter keyword(s) to search by movie title
    # - a button to Search by Movie Title
    
    it "displays an error message if the id provided doesn't match a valid user" do
      visit "/users/1/discover"

      expect(page).to have_content("Error:")

      user_1 = User.create!(name: 'Tommy', email: 'tommy@email.com')

      visit "/users/#{user_1.id}/discover"

      expect(page).to_not have_content("Error:")
    end

    it "displays a button to Discover Top Rated Movies" do
      user_1 = User.create!(name: 'Tommy', email: 'tommy@email.com')

      visit "/users/#{user_1.id}/discover"

      expect(page).to have_button("Discover Top Rated Movies")
    end

    it "displays a text field to enter keyword(s) to search by movie title" do
      user_1 = User.create!(name: 'Tommy', email: 'tommy@email.com')

      visit "/users/#{user_1.id}/discover"

      expect(page).to have_content("Enter keyword(s)")
    end

    it "displays a button to Search by Movie Title" do
      user_1 = User.create!(name: 'Tommy', email: 'tommy@email.com')

      visit "/users/#{user_1.id}/discover"

      expect(page).to have_button("Search by Movie Title")
    end
  end
end