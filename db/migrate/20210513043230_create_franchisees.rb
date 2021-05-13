class CreateFranchisees < ActiveRecord::Migration[5.2]
  def change
    create_table :franchisees do |t|
      t.string :name
      t.string :city
      t.string :state
      t.boolean :independent
      t.float :annual_sales
      t.float :intitial_fee
      t.float :pct_fee
      t.timestamps
    end
  end
end
