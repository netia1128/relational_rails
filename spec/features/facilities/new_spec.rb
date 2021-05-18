require 'rails_helper'

RSpec.describe 'facilities new page', type: :feature do

  describe '#new page appearance' do
    it 'contains the nav bar' do
      visit "/facilities/new"

      expect(page).to have_content("Facilities")
      expect(page).to have_content("Licenses")
      expect(page).to have_content("Home")
    end
  end
  describe '#new page functionality' do
    it 'allows you to enter details to add a new facility' do
      visit "/facilities/new"

      expect(page).to have_content('Street Number:')
      expect(page).to have_content('Street Prefix:')
      expect(page).to have_content('Street Name:')
      expect(page).to have_content('Street Type:')
      expect(page).to have_content('Unit Info:')
      expect(page).to have_content('City:')
      expect(page).to have_content('Zip Code:')
      expect(page).to have_content('Square Footage:')
      expect(page).to have_content('Has Certificate of Occupancy:')
    end
    it 'redirects you to the facilities page after creating a new record' do
      visit "/facilities/new"
      page.fill_in 'b3_street_number', with: '1311'
      page.fill_in 'b3_street_name', with: '27TH'
      page.fill_in 'b3_street_type', with: 'Ave'
      page.fill_in 'b3_city', with: 'Denver'
      page.fill_in 'b3_state', with: 'CO'
      page.fill_in 'b3_zip', with: '80205'
      page.fill_in 'b3_square_footage', with: 700
      click_button 'Add Facility'

      expect(current_path).to eq("/facilities")
      expect(page).to have_content("27TH AVE DENVER CO 80205")
    end
  end
end

    # save_and_open_page