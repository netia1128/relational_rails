
require 'rails_helper'

RSpec.describe 'facilities_licenses#new page', type: :feature do
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

  it 'allows you to enter details to add a new license' do
    visit "/facilities/#{@facility1.id}/licenses/new"

    expect(page).to have_content("Business Name:")
    expect(page).to have_content('License Type:')
    expect(page).to have_content('License Status:')
    expect(page).to have_content('Does Extractions:')
    expect(page).to have_content('Plant Count:')
  end

  it 'redirects you to the facilities_Licenses#index page after creating a new record and displays new record' do
    visit "/facilities/#{@facility1.id}/licenses/new"
    page.fill_in 'b1permit[b1_special_text]', with: "Netia's Pot Place"
    page.select 'Retail Marijuana Store', from: 'b1permit[b1_per_sub_type]'
    page.select 'Active', from: 'b1permit[b1_appl_status]'
    page.fill_in 'b1permit[b1_plant_count]', with: 700
    click_on 'Add License'

    expect(current_path).to eq("/facilities/#{@facility1.id}/licenses")
    expect(page).to have_content("Netia's Pot Place")
    expect(page).to have_content("Retail Marijuana Store")
    expect(page).to have_content("Active")
  end
end

    # save_and_open_page