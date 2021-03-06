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

    @license1 = @facility1.B1Permits.create(
                b1_special_text: "Netia's Weed House",
                b1_appl_status: "Active",
                b1_per_sub_type: "Retail Marijuana Store",
                b1_expiration: 1.year.from_now,
                b1_extraction: true,
                b1_plant_count: nil
    )

    @license2 = @facility1.B1Permits.create(
                b1_special_text: "Panda's Pot Palace",
                b1_appl_status: "Pending",
                b1_per_sub_type: "Medical Marijuana Center",
                b1_expiration: 1.year.from_now,
                b1_extraction: true,
                b1_plant_count: nil
    )

    @license3 = @facility1.B1Permits.create(
                b1_special_text: "Brian's Bong Bazzar",
                b1_appl_status: "Pending",
                b1_per_sub_type: "Retail Marijuana Cultivation",
                b1_expiration: 1.year.from_now,
                b1_extraction: false,
                b1_plant_count: nil
    )
  end

  describe 'page appearance' do
    it 'can see all license names' do
      visit '/licenses'

      expect(page).to have_content(@license1.b1_special_text)
      expect(page).to have_content(@license2.b1_special_text)
      expect(page).to have_content(@license1.b1_appl_status)
      expect(page).to have_content(@license2.b1_per_sub_type)
    end
    it 'only shows records where the boolean value is true' do
      visit '/licenses'

      expect(page).to have_content(@license1.b1_special_text)
      expect(page).to have_content(@license2.b1_special_text)
      expect(page).to_not have_content(@license3.b1_special_text)
      expect(page).to have_content(@license1.b1_appl_status)
      expect(page).to_not have_content(@license3.b1_per_sub_type)
    end
  end
  describe 'page functionality' do
    it 'has links to edit each license' do
      visit "/licenses"

      expect(page).to have_content("Edit Info")

      click_link('Edit Info', match: :first)

      expect(current_path).to eq("/licenses/#{@license1.id}/edit")
    end
    it 'has links to delete each license' do
      visit '/licenses'

      expect(page).to have_content("Delete License")

      click_link('Delete License', match: :first)

      expect(current_path).to eq('/licenses')
      expect(page).to_not have_content('201')
    end
    it 'allows you to filter licenses by an exact business name match' do
      visit '/licenses'

      expect(page).to have_content("Filter by exact business name")

      page.fill_in 'exact_name_filter', with: "Panda's Pot Palace"

      click_button('Filter', match: :first)

      expect(page).to_not have_content('Netia')
      expect(page).to have_content('Panda')
    end
    it 'allows you to filter licenses by a partial business name match' do
      visit '/licenses'

      expect(page).to have_content("Filter by partial business name")

      page.fill_in 'partial_name_filter', with: 'Panda'

      click_button('Filter', match: :first)

      expect(page).to_not have_content('Netia')
      expect(page).to have_content('Panda')
    end
  end
end