class Franchisee < ApplicationRecord
  belongs_to :franchisor

  def self.find_independent
    self.all.find_all do |franchisee|
      franchisee.independent == true
    end
  end

  def self.sort_alphabetically
    self.order(:name)
  end

  def self.filter_annual_sales(sales)
    self.all.find_all do |franchisee|
      franchisee.annual_sales > sales
    end
  end
end
