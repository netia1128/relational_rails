# app/controllers/facilities_controller.rb

class FacilitiesController < ApplicationController
  protect_from_forgery with: :null_session

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
      b3_square_footage: params[:facility][:b3_square_footage],
      b3_has_co: params[:facility][:b3_has_co]
    })

    b3_facility.save
    redirect_to '/facilities'
  end

  def edit
    @b3_facility = B3Facility.find(params[:id])
  end

  def index
    @b3facilities = B3Facility.sort_by_id
  end

  def new
  end

  def show
    @b3_facility = B3Facility.find(params[:id])
  end

  def update
    b3_facility = B3Facility.find(params[:id])
    b3_facility.update({
      b3_street_number: params[:facility][:b3_street_number],
      b3_street_prefix: params[:facility][:b3_street_prefix],
      b3_street_name: params[:facility][:b3_street_name],
      b3_street_type: params[:facility][:b3_street_type],
      b3_unit_info: params[:facility][:b3_unit_info],
      b3_city: params[:facility][:b3_city],
      b3_state: params[:facility][:b3_state],
      b3_zip: params[:facility][:b3_zip],
      b3_square_footage: params[:facility][:b3_square_footage],
      b3_has_co: params[:facility][:b3_has_co]
    })
    b3_facility.save
    redirect_to "/facilities/#{params[:id]}"
  end
end