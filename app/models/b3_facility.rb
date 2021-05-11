# app/models/facility.rb

class B3Facility < ApplicationRecord
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
            address_piece != ''
        end.join(' ').upcase
    end
end