class Franchisee < ApplicationRecord
  belongs_to :franchisor

  def convert_number
    if self.pct_fee.nil?
      0
    else
      self.pct_fee * 100
    end
  end

  def self.find_independent
    self.where('independent = true')
  end

  def self.sort_alphabetically
    self.order(:name)
  end

  def self.filter_annual_sales(sales)
    self.where('annual_sales > ?', sales)
  end
end
