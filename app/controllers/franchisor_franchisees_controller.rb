class FranchisorFranchiseesController < ApplicationController
  def index
    @franchisor = Franchisor.find(params[:franchisor_id])
    @franchisees = @franchisor.franchisees
  end
end
