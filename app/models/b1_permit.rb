# app/models/facility.rb

class B1Permit < ApplicationRecord
  belongs_to :b3_facility

  def self.b1_permits_that_extract
    b1permits = B1Permit.all.where(b1_extraction: true)
  end
end