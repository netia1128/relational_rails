# app/models/facility.rb

class B3Facility < ApplicationRecord
    has_many :B1Permits

    def full_address
        arr = [
            b3_street_number,
            b3_street_prefix,
            b3_street_name,
            b3_street_type,
            b3_unit_info,
            b3_city,
            b3_state,
            b3_zip
        ]

        arr_to_join = arr.find_all do |address_piece|
            address_piece != '' && address_piece != nil
        end.join(' ').upcase
    end

    def related_b1_permits(b3_facility)
        b1permits = B1Permit.all
        b1permits.find_all do |b1permit|
          b1permit.b3_facility_id == b3_facility.id
        end
      end
end