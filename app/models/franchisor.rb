class Franchisor < ApplicationRecord
  has_many :franchisees

  def self.sort_by_created_desc
    self.all.order(created_at: :desc)
  end

  def count_franchisees
    self.franchisees.count
  end
end
