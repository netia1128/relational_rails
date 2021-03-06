require 'rails_helper'

RSpec.describe 'licenses edit page', type: :feature do
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
    @license1 = @facility1.B1Permits.create(
      b1_special_text: "Netia's Weed House",
      b1_appl_status: "Active",
      b1_per_sub_type: "Retail Marijuana Store",
      b1_expiration: 1.year.from_now,
      b1_extraction: false,
      b1_plant_count: nil
    )
  end

  describe 'page appearance' do
    it 'shows me all the editable fields for a record' do
      visit "/licenses/#{@license1.id}/edit"

      expect(page).to have_content('Business Name:')
      expect(page).to have_content('License Status:')
      expect(page).to have_content('Does Extractions:')
      expect(page).to have_content('Plant Count:')
    end
  end
  describe 'page functionality' do
    it 'allows me to edit the editable fields submit changes and then reidrects to licenses#show' do
      visit "/licenses/#{@license1.id}/edit"

      page.fill_in 'b1permit[b1_special_text]', with: "Jamison's Cookie Factory"
      page.select 'Revoked', from: 'b1permit[b1_appl_status]'
      page.fill_in 'b1permit[b1_plant_count]', with: nil
      click_on 'Submit Edits'

      expect(current_path).to eq("/licenses/#{@license1.id}")
      expect(page).to have_content("Jamison's Cookie Factory")
      expect(page).to have_content("Revoked")
      expect(page).to have_content("Retail Marijuana Store")
    end
  end
end