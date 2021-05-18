require 'rails_helper'

RSpec.describe 'facilities edit page', type: :feature do
  before(:each) do
    @facility1 = B3Facility.create(
                b3_street_number: 1311,
                b3_street_prefix: 'E',
                b3_street_name: "27TH",
                b3_street_type: "AVE",
                b3_unit_info: nil,
                b3_city: "Denver",
                b3_state: "CO",
                b3_zip: 80205,
                b3_has_co: true
    )
  end

  describe '#edit page appearance' do
    it 'shows me all the editable fields for a record' do
      visit "/facilities/#{@facility1.id}/edit"

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
  end
  describe '#edit page functionality' do
    it 'allows me to edit the editable fields submit changes and then reidrects to facilities#show' do
      visit "/facilities/#{@facility1.id}/edit"

      page.fill_in 'b3_street_number', with: '2930'
      page.fill_in 'b3_street_name', with: 'Bruce Randolph'
      page.fill_in 'b3_street_type', with: 'Ave'
      page.fill_in 'b3_zip', with: '80205'
      page.fill_in 'b3_square_footage', with: 1300
      click_on 'Submit Edits'

      expect(current_path).to eq("/facilities/#{@facility1.id}")
      expect(page).to have_content("2930 BRUCE RANDOLPH AVE DENVER CO 80205")
    end
  end
end

