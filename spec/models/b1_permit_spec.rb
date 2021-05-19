require 'rails_helper'

RSpec.describe B1Permit, type: :model do
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
        b1_special_text: "ZNetia's Weed House",
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
        b1_extraction: false,
        b1_plant_count: nil
    )

    @license3 = @facility1.B1Permits.create(
      b1_special_text: "Brian's Bong Bazaar",
      b1_appl_status: "Pending",
      b1_per_sub_type: "Medical Marijuana Center",
      b1_expiration: 1.year.from_now,
      b1_extraction: true,
      b1_plant_count: nil
  )
  end

  it {should belong_to :b3_facility}

  describe 'class methods' do
    describe '#b1_permits_that_extract' do
      it 'returns all B1Permit objects that do extractions' do

        expect(B1Permit.b1_permits_that_extract).to eq([@license1, @license3])
      end

      it 'returns permits in id order by default' do

        expect(B1Permit.b1_permits_that_extract.first).to eq(@license1)
        expect(B1Permit.b1_permits_that_extract.last).to eq(@license3)
      end
    end
    describe '#exact_name_filter' do
      it 'determines how the class should be filtered and sorted' do
        params2 = exact_name_filter = "Panda's Pot Palace"
        expect(B1Permit.exact_name_filter(params2).count).to eq(1)
        expect(B1Permit.exact_name_filter(params2).first).to eq(@license2)
      end
    end
    describe '#partial_name_filter' do
      it 'determines how the class should be filtered and sorted' do
        params3 = partial_name_filter = 'Panda'
        expect(B1Permit.partial_name_filter(params3).count).to eq(1)
        expect(B1Permit.partial_name_filter(params3).first).to eq(@license2)
      end
    end
  end
end