require 'rails_helper'

RSpec.describe B3Facility, type: :model do

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
        b3_street_name: "COLFAX",
        b3_street_type: "AVE",
        b3_unit_info: nil,
        b3_city: "Denver",
        b3_state: "CO",
        b3_zip: 80202,
        b3_has_co: true
      )

      @license1 = @facility1.B1Permits.create(
        b1_special_text: "ZNetia's Weed House",
        b1_appl_status: "Active",
        b1_per_sub_type: "Retail Marijuana Store",
        b1_expiration: 1.year.from_now,
        b1_extraction: true,
        b1_plant_count: 25
      )
  end

  it {should have_many :B1Permits}

  describe 'instance methods' do
    describe '#full address' do
      it 'concatanates all the address pieces into a single full address' do

        expect(@facility1.full_address).to eq("1311 E 27TH AVE DENVER CO 80205")
      end
    end

    describe '#filtered_b1_permits' do
      it 'filters by a plant count, if applicable' do

        expect(@facility1.filtered_b1_permits(@facility1, 25)).to eq([])
        expect(@facility1.filtered_b1_permits(@facility1, 20)).to eq([@license1])
      end
    end
  end

  describe 'class methods' do
    describe '#sort by id' do
      it 'sorts records by created by id' do

        expect(B3Facility.sort_by_id.first).to eq(@facility2)
        expect(B3Facility.sort_by_id.last).to eq(@facility1)
      end
    end

    describe '#count' do
      it 'counts the number of records in a table' do

        expect(B3Facility.all.count).to eq(2)
      end
    end
  end
end