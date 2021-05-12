# app/controllers/licenses_controller.rb

class LicensesController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    @b1permits = B1Permit.all
  end

  def new
    pre_string = params[:id].to_s
    @b3_facility_id = pre_string.delete_suffix('/')
    # require 'pry'; binding.pry
  end

  def create
    # attrs = params[:b1permit]
    # B1Permit.create(
    b1_permit = B1Permit.new({
      # b3_facility_id: params[:b1permit][:b3_facility_id].
      b1_special_text: params[:b1permit][:b1_special_text],
      b1_appl_status: params[:b1permit][:b1_appl_status],
      b1_per_sub_type: params[:b1permit][:b1_per_sub_type],
      b1_expiration: 1.year.from_now,
      b1_extraction: params[:b1permit][:b1_extraction],
      b1_plant_count: params[:b1permit][:b1_plant_count]
    })
# require 'pry'; binding.pry
    b1_permit.save!
    # require 'pry'; binding.pry
    redirect_to '/licenses'
  end

  def see_details
    @b1_permit = B1Permitfind(params[:id])
  end
end