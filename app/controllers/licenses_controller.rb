# app/controllers/licenses_controller.rb

class LicensesController < ApplicationController
  protect_from_forgery with: :null_session

  def edit
    @b1_permit = B1Permit.find(params[:id])
  end

  def index
    @b1permits = B1Permit.b1_permits_that_extract(params[:order_by])
  end

  def show
    @b1_permit = B1Permit.find(params[:id])
    @b3_facility = B3Facility.find(@b1_permit.b3_facility_id)
  end

  def update
    b1_permit = B1Permit.find(params[:id])
    b1_permit.update({
      b1_special_text: params[:b1permit][:b1_special_text],
      b1_appl_status: params[:b1permit][:b1_appl_status],
      b1_extraction: params[:b1permit][:b1_extraction],
      b1_plant_count: params[:b1permit][:b1_plant_count]
    })
    b1_permit.save
    redirect_to "/licenses/#{params[:id]}"
  end
end