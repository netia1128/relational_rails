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

        arr.find_all do |address_piece|
            address_piece != '' && address_piece != nil && address_piece != ' '
        end.join(' ').upcase
    end

    def self.default_sort
        order(id: :desc)
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

    def self.filter_by_exact_address(exact_address_filter)
      b3facilities = B3Facility.all
      b3facilities.find_all do |facility|
        facility.full_address == exact_address_filter.upcase
      end
    end

    def self.filter_by_partial_address(partial_address_filter)
      b3facilities = B3Facility.all
      b3facilities.find_all do |facility|
        facility.full_address.include? partial_address_filter.upcase
      end
    end
end