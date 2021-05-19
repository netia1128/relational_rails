# app/models/facility.rb

class B1Permit < ApplicationRecord
  belongs_to :b3_facility

  def self.b1_permits_that_extract
    b1permits = B1Permit.all.where(b1_extraction: true)
  end

  def self.filter_and_sort(params)
    if !params[:exact_name_filter].nil? && params[:exact_name_filter] != ''
        B1Permit.where(b1_special_text: params[:exact_name_filter])
    elsif !params[:partial_name_filter].nil? && params[:partial_name_filter] != ''
        B1Permit.where("#{:b1_special_text} LIKE ?", "%#{params[:partial_name_filter]}%")
    else
        B1Permit.b1_permits_that_extract
    end
end
end