# app/models/facility.rb

class B1Permit < ApplicationRecord
  belongs_to :b3_facility

  def self.b1_permits_that_extract
    B1Permit.all.find_all do |permit|
      permit.b1_extraction == true
    end
  end
end