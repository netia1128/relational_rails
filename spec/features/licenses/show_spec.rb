require 'rails_helper'

RSpec.describe 'licenses show page', type: :feature do
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

    @license2 = @facility1.B1Permits.create(
      b1_special_text: "Panda's Pot Palace",
      b1_appl_status: "Pending",
      b1_per_sub_type: "Medical Marijuana Center",
      b1_expiration: 1.year.from_now,
      b1_extraction: false,
      b1_plant_count: nil
)
  end

  it 'shows you details for a specific license' do
    visit "/licenses/#{@license2.id}"


    expect(page).to have_content(@facility1.full_address)
    expect(page).to have_content('License Number:')
    expect(page).to have_content("Business Name:Panda's Pot Palace")
    expect(page).to have_content('License Type:Medical Marijuana Center')
    expect(page).to_not have_content('License Type:Retail Marijuana Store')
    expect(page).to have_content('Expiration Date:')
    expect(page).to have_content('Does Extractions?: No')
    expect(page).to have_content('Plant Count:')
  end

  it 'has a button that allows you to update the record' do
    visit "/licenses/#{@license1.id}"

    click_on 'Edit License Details'
    expect(current_path).to eq("/licenses/#{@license1.id}/edit")
  end
end

    # save_and_open_page