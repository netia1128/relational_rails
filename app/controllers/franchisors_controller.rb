class FranchisorsController < ApplicationController
  def index
    @franchisors = Franchisor.all
  end

  def show
    @franchisor = Franchisor.find(params[:id])
  end
end
