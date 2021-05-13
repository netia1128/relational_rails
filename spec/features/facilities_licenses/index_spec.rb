require 'rails_helper'

RSpec.describe 'facilities licenses index page', type: :feature do
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

    @license1 = @facility1.B1Permits.create(
                b1_special_text: "Netia's Weed House",
                b1_appl_status: "Active",
                b1_per_sub_type: "Retail Marijuana Store",
                b1_expiration: 1.year.from_now,
                b1_extraction: false,
                b1_plant_count: nil
    )

    @license2 = @facility2.B1Permits.create(
      b1_special_text: "Panda's Pot Palace",
      b1_appl_status: "Pending",
      b1_per_sub_type: "Medical Marijuana Center",
      b1_expiration: 1.year.from_now,
      b1_extraction: false,
      b1_plant_count: nil
)
  end

  it 'can see all licenses for a specific facility' do
    visit "/facilities/#{@facility1.id}/licenses"

    expect(page).to have_content(@license1.b1_special_text)
    expect(page).to_not have_content(@license2.b1_special_text)
    expect(page).to have_content(@license1.b1_appl_status)
    expect(page).to_not have_content(@license2.b1_per_sub_type)
  end

  it 'includes a count of the current number of licenses at the facility' do
    visit "/facilities/#{@facility1.id}/licenses"

    expect(page).to have_content('This facility currently has 1 license(s):')
  end
end


# User Story 5, Parent Children Index (x2)

# As a visitor
# When I visit '/parents/:parent_id/child_table_name'
# Then I see each Child that is associated with that Parent with each Child's attributes: