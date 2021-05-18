require 'rails_helper'

RSpec.describe 'facilities show page', type: :feature do
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
                b3_square_footage: 700,
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
                b3_square_footage: 225000,
                b3_has_co: false
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

  it 'contains the nav bar' do
    visit "/facilities/#{@facility1.id}"

    expect(page).to have_content("Facilities")
    expect(page).to have_content("Licenses")
    expect(page).to have_content("Home")
  end

  it 'shows you details for a specific facility' do
    visit "/facilities/#{@facility1.id}"

    expect(page).to have_content(@facility1.full_address)
    expect(page).to have_content('Facility ID:')
    expect(page).to have_content('Street Number:1311')
    expect(page).to have_content('Street Prefix:E')
    expect(page).to_not have_content('Street Prefix:N')
    expect(page).to have_content('Street Type:AVE')
    expect(page).to have_content('Unit Info:')
    expect(page).to have_content('City:Denver')
    expect(page).to have_content('Zip Code:80205')
    expect(page).to have_content('Square Footage:700')
    expect(page).to have_content('Has a Certificate of Occupancy: Yes')
    expect(page).to have_content('Created At:')
    expect(page).to have_content('Updated At')
  end

  it 'has a link to a facilitys licenses page' do
    visit "/facilities/#{@facility1.id}"

    click_on 'See 1 Associated Licenses'
    expect(current_path).to eq("/facilities/#{@facility1.id}/licenses")
  end

  it 'shows a count of licenses related to the facility' do
    visit "/facilities/#{@facility1.id}"

    expect(page).to have_content("See 1 Associated Licenses")
  end

  it 'has a button that allows you to update the record' do
    visit "/facilities/#{@facility1.id}"

    click_on 'Edit Facility Details'
    expect(current_path).to eq("/facilities/#{@facility1.id}/edit")
  end

  it 'has a button to delete each facility' do
    visit "/facilities/#{@facility1.id}"

    click_on 'Delete Facility'

    expect(current_path).to eq('/facilities')
    expect(page).to_not have_content('1311')

    visit "/licenses"

    expect(page).to_not have_content('Netia')
  end
end

    # save_and_open_page