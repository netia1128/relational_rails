class Franchisee < ApplicationRecord
  belongs_to :franchisor

  def self.find_independent
    self.all.find_all do |franchisee|
      franchisee.independent == true
    end
  end
end
