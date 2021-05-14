# app/controllers/licenses_controller.rb

class LicensesController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    @b1permits = B1Permit.all
  end

  def show
    @b1_permit = B1Permit.find(params[:id])
    @b3_facility = B3Facility.find(@b1_permit.b3_facility_id)
  end
end