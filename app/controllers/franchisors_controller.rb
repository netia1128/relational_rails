class FranchisorsController < ApplicationController
  def index
    @franchisors = Franchisor.all.order(created_at: :desc)
  end

  def show
    @franchisor = Franchisor.find(params[:id])
  end
end
