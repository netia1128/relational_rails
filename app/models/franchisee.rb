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
end
