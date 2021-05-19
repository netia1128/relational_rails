# app/controllers/licenses_controller.rb

class LicensesController < ApplicationController
  protect_from_forgery with: :null_session

  def edit
    @b1_permit = B1Permit.find(params[:id])
  end

  def destroy
    b1_permit = B1Permit.find(params[:id])
    b1_permit.destroy
    redirect_to "/licenses"
  end

  def index
    @b1permits = if !params[:exact_name_filter].nil? && params[:exact_name_filter] != ''
      B1Permit.exact_name_filter(params[:exact_name_filter])
    elsif !params[:partial_name_filter].nil? && params[:partial_name_filter] != ''
      B1Permit.partial_name_filter(params[:partial_name_filter])
    else
      B1Permit.b1_permits_that_extract
  end
  end

  def show
    @b1_permit = B1Permit.find(params[:id])
    @b3_facility = B3Facility.find(@b1_permit.b3_facility_id)
  end

  def update
    b1_permit = B1Permit.find(params[:id])
    b1_permit.update(b1permit_params)
    b1_permit.save
    redirect_to "/licenses/#{params[:id]}"
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