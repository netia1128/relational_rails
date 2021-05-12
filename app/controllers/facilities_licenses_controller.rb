# app/controllers/facilities_licenses_controller.rb

class FacilitiesLicensesController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    @b3_facility = B3Facility.find(params[:id])
    @b1permits = @b3_facility.B1Permits
  end

  def new
  end
end