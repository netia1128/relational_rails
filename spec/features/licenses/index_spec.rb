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

  it 'can see all license names' do
    visit '/licenses'
    # save_and_open_page

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

  it 'allows you to sort by ID or business name' do
    visit '/licenses'

    expect(page).to have_content(@license1.b1_special_text)
    expect(page).to have_content(@license2.b1_special_text)
    expect(page).to_not have_content(@license3.b1_special_text)
    expect(page).to have_content(@license1.b1_appl_status)
    expect(page).to_not have_content(@license3.b1_per_sub_type)
  end

  it 'has links to edit each license' do
    visit "/licenses"

    expect(page).to have_content("Edit Info")

    click_link('Edit Info', match: :first)

    expect(current_path).to eq("/licenses/#{@license1.id}/edit")
  end
end