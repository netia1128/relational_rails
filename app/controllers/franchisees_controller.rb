class FranchiseesController < ApplicationController
  def index
    @franchisees = Franchisee.all
  end

  def show
    @franchisee = Franchisee.find(params[:id])
  end

  def edit
    @franchisee = Franchisee.find(params[:id])
  end

  def update
    @franchisee = Franchisee.find(params[:id])
    @franchisee.update(franchisee_params)
    redirect_to "/franchisees/#{@franchisee.id}"
  end

  private

  def franchisee_params
    params.permit(:name, :city, :state, :independent, :annual_sales, :initial_fee, :pct_fee)
  end
end
