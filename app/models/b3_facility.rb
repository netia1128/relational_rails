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

    def filtered_b1_permits(plant_count_filter, order_by = "id")
        if plant_count_filter.nil?
            plant_count_filter = -1
        end
        self.B1Permits.where("b1_plant_count > ?", plant_count_filter.to_i).order(order_by.to_s)
    end

    def related_b1_permit_count
        self.B1Permits.count
    end
end