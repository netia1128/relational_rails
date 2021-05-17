class FranchisorsController < ApplicationController
  def index
    @franchisors = Franchisor.sort_by_created_desc
  end

  def show
    @franchisor = Franchisor.find(params[:id])
  end

  def new
  end

  def create
    @franchisor = Franchisor.create(franchisor_params)
    redirect_to "/franchisors"
  end

  def edit
    @franchisor = Franchisor.find(params[:id])
  end

  def update
    @franchisor = Franchisor.find(params[:id])
    @franchisor.update(franchisor_params)
    # binding pry
    redirect_to "/franchisors/#{@franchisor.id}"
  end

  def destroy
    franchisor = Franchisor.find(params[:id])
    franchisor.destroy
    redirect_to '/franchisors'
  end

  def destroy
    franchisor = Franchisor.find(params[:id])
    franchisor.destroy
    redirect_to '/franchisors'
  end

  private

  def franchisor_params
    params.permit(:name, :hq_city, :hq_state, :quick_service, :franchisee_cost)
  end
end
