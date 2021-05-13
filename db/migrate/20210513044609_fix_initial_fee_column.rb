class FixInitialFeeColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :franchisees, :intitial_fee, :initial_fee
  end
end
