class FranchiseesController < ApplicationController
  def index
    @franchisees = Franchisee.all
  end

  def show
    @franchisee = Franchisee.find(params[:id])
  end
end
