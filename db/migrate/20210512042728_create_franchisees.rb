class CreateFranchisees < ActiveRecord::Migration[5.2]
  def change
    create_table :franchisees do |t|
      t.integer :franchisor_id
      t.string :name
      t.string :city
      t.string :state
      t.boolean :independent
      t.float :sales
      t.float :initial_fee
      t.float :pct_fee_to_hq
      t.timestamps
    end
  end
end
