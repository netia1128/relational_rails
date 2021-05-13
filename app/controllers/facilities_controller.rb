# app/controllers/facilities_controller.rb

class FacilitiesController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    @b3facilities = B3Facility.sort_by_id
  end

  def new
  end

  def create
    b3_facility = B3Facility.new({
      b3_street_number: params[:facility][:b3_street_number],
      b3_street_prefix: params[:facility][:b3_street_prefix],
      b3_street_name: params[:facility][:b3_street_name],
      b3_street_type: params[:facility][:b3_street_type],
      b3_unit_info: params[:facility][:b3_unit_info],
      b3_city: params[:facility][:b3_city],
      b3_state: params[:facility][:b3_state],
      b3_zip: params[:facility][:b3_zip],
      b3_has_co: params[:facility][:b3_has_co],
      created_at: Time.now,
      updated_at: Time.now
    })

    b3_facility.save
    redirect_to '/facilities'
  end

  def show
    @b3_facility = B3Facility.find(params[:id])
  end
end