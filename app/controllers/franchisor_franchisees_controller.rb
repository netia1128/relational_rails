class FranchisorFranchiseesController < ApplicationController
  def index
    @franchisor = Franchisor.find(params[:id])
    @franchisees = @franchisor.franchisees
  end
end
