# app/models/facility.rb

class B3Facility < ApplicationRecord
    has_many :B1Permits, dependent: :destroy

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

    def filtered_b1_permits(b3_facility, plant_count_filter)
        if plant_count_filter.nil?
            plant_count_filter = 0
        end
        b3_facility.B1Permits.find_all do |b1permit|
            b1permit.b1_plant_count > plant_count_filter.to_i
        end
    end
end