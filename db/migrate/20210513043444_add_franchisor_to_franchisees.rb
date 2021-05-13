class AddFranchisorToFranchisees < ActiveRecord::Migration[5.2]
  def change
    add_reference :franchisees, :franchisor, foreign_key: true
  end
end
