# app/controllers/facilities_controller.rb

class FacilitiesController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    B3Facility.create(b3facility_params)
    redirect_to '/facilities'
  end

  def destroy
    b3_facility = B3Facility.find(params[:id])
    b3_facility.destroy
    redirect_to '/facilities'
  end

  def edit
    @b3_facility = B3Facility.find(params[:id])
  end

  def index
    @b3facilities = B3Facility.filter_and_sort(params)
    # @b3facilities = B3Facility.sort_by_id
    # @b3facilities = @b3_facilities.filtered_by_partial_address(params[:partial_address_filter], params[:order_by])
    # @b3facilities = @b3_facilities.filtered_by_exact_address(params[:exact_address_filter], params[:order_by])
  end

  def new
  end

  def show
    @b3_facility = B3Facility.find(params[:id])
  end

  def update
    b3_facility = B3Facility.find(params[:id])
    b3_facility.update(b3facility_params)
    b3_facility.save
    redirect_to "/facilities/#{params[:id]}"
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