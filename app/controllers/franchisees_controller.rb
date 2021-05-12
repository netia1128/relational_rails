class FranchiseesController < ApplicationController
  def index
    @franchisees = Franchisee.all
  end
end