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
  end

  it {should have_many :B1Permits}

  describe 'instance methods' do
    describe '#full address' do
      it 'concatanates all the address pieces into a single full address' do

        expect(@facility1.full_address).to eq("1311 E 27TH AVE DENVER CO 80205")
      end
    end
  end
end