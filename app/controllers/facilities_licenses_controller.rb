# app/controllers/facilities_licenses_controller.rb

class FacilitiesLicensesController < ApplicationController
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
    @b3_facility = B3Facility.find(params[:id])
    @b1permits = @b3_facility.filtered_b1_permits(params[:plant_count_filter], params[:order_by])
  end

  def new
  end

  private

  def b3facility_params
    params.permit(:b3_street_number,
      :b3_street_prefix,
      :b3_street_name,
      :b3_street_type,
      :b3_unit_info,
      :b3_city,
      :b3_state,
      :b3_zip,
      :b3_square_footage,
      :b3_has_co)
  end
end