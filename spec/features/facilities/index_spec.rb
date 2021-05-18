require 'rails_helper'

RSpec.describe 'facilities index page', type: :feature do
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

    @facility2 = B3Facility.create(
                b3_street_number: 201,
                b3_street_prefix: 'W',
                b3_street_name: "ColFax",
                b3_street_type: "Ave",
                b3_unit_info: nil,
                b3_city: "Denver",
                b3_state: "CO",
                b3_zip: 80202,
                b3_has_co: false
    )

    @facility3 = B3Facility.create(
                b3_street_number: 2930,
                b3_street_prefix: 'E',
                b3_street_name: "Bruce Randolph",
                b3_street_type: "Ave",
                b3_unit_info: nil,
                b3_city: "Denver",
                b3_state: "CO",
                b3_zip: 80205,
                b3_has_co: true
   )
  end

  describe '#index page appearance' do
    it 'can see all facility addresses' do
      visit '/facilities'

      expect(page).to have_content(@facility1.full_address)
      expect(page).to have_content(@facility2.full_address)
    end
    it 'displays the facilities in the order which they were created' do
      visit '/facilities'

      expect(page).to have_content("Facility ID")
      expect(@facility2.full_address).to appear_before(@facility1.full_address)
    end
    it 'includes a count of the current number of facilities' do
      visit '/facilities'

      expect(page).to have_content('Denver currently has 3 facilities:')
    end
  end
  describe '#index page functionality' do
    it 'allows me to add a new facility' do
      visit '/facilities'
      click_on 'Add New Facility'

      expect(current_path).to eq("/facilities/new")
    end
    it 'has links to edit each facility' do
      visit '/facilities'

      expect(page).to have_content("Edit Info")

      click_link('Edit Info', match: :first)

      expect(current_path).to eq("/facilities/#{@facility3.id}/edit")
    end
    it 'has links to delete each facility' do
      visit '/facilities'

      expect(page).to have_content("Delete Facility")

      click_link('Delete Facility', match: :first)

      expect(current_path).to eq('/facilities')
      expect(page).to_not have_content('2930')
    end
  end
end

    # save_and_open_page