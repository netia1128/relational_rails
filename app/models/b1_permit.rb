# app/models/facility.rb

class B1Permit < ApplicationRecord
  belongs_to :b3_facility

  def self.b1_permits_that_extract(order_by = "id")
    b1permits = B1Permit.all.order(order_by.to_s)
    b1permits.find_all do |permit|
      permit.b1_extraction == true
    end
  end
end