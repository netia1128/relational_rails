class FranchisorFranchiseesController < ApplicationController
  def index
    @franchisor = Franchisor.find(params[:franchisor_id])
    if params[:sort_alphabetical] == "true"
      @franchisees = @franchisor.franchisees.sort_alphabetically
    else
      @franchisees = @franchisor.franchisees
    end
  end

  def new
    @franchisor = Franchisor.find(params[:franchisor_id])
  end

  def create
    @franchisor = Franchisor.find(params[:franchisor_id])
    @franchisee = Franchisee.create(franchisee_params)
    redirect_to "/franchisors/#{@franchisor.id}/franchisees"
  end

  private

  def franchisee_params
    params.permit(:name, :city, :state, :independent, :annual_sales, :initial_fee, :pct_fee, :franchisor_id)
  end
end
