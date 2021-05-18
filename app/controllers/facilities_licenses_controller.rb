# app/controllers/facilities_licenses_controller.rb

class FacilitiesLicensesController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    B1Permit.create(
      b3_facility_id: params[:id],
      b1_special_text: b1permit_params[:b1_special_text],
      b1_appl_status: b1permit_params[:b1_appl_status],
      b1_per_sub_type: b1permit_params[:b1_per_sub_type],
      b1_expiration: 1.year.from_now,
      b1_extraction: b1permit_params[:b1_extraction],
      b1_plant_count: b1permit_params[:b1_plant_count]
    )
    redirect_to "/facilities/#{params[:id]}/licenses"
  end

  def index
    @b3_facility = B3Facility.find(params[:id])
    @b1permits = @b3_facility.filtered_b1_permits(params[:plant_count_filter], params[:order_by])
  end

  def new
  end

  private

  def b1permit_params
    params.require(:b1permit).permit(:b1_special_text,
      :b1_appl_status,
      :b1_per_sub_type,
      :b1_extraction,
      :b1_plant_count)
  end
end