# app/controllers/licenses_controller.rb

class LicensesController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    B1Permit.create(
      b3_facility_id: params[:id],
      b1_special_text: params[:b1permit][:b1_special_text],
      b1_appl_status: params[:b1permit][:b1_appl_status],
      b1_per_sub_type: params[:b1permit][:b1_per_sub_type],
      b1_expiration: 1.year.from_now,
      b1_extraction: params[:b1permit][:b1_extraction],
      b1_plant_count: params[:b1permit][:b1_plant_count]
    )
    redirect_to "/facilities/#{params[:id]}/licenses"
  end

  def index
    @b1permits = B1Permit.all
  end

  def new
  end

  def show
    @b1_permit = B1Permit.find(params[:id])
    @b3_facility = B3Facility.find(@b1_permit.b3_facility_id)
  end
end