# app/models/facility.rb

class B1Permit < ApplicationRecord
  belongs_to :b3_facility

  def self.b1_permits_that_extract
    b1permits = where(b1_extraction: true)
  end

  def self.exact_name_filter(exact_name_filter)
    where(b1_special_text: exact_name_filter)
  end

  def self.partial_name_filter(partial_name_filter)
    where("b1_special_text LIKE ?", "%#{partial_name_filter}%")
  end
end