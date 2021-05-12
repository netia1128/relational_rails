class FranchisorsController < ApplicationController
  def index
    @franchisors = Franchisor.all
  end
end