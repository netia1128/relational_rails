class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.sort_by_created
    self.all.order(:created_at)
  end

  def self.sort_by_id
    self.all.order(id: :desc)
  end

  def self.count
    self.all.count
  end
end
