class CreateFranchisors < ActiveRecord::Migration[5.2]
  def change
    create_table :franchisors do |t|
      t.string :name
      t.string :hq_city
      t.string :hq_state
      t.boolean :quick_service
      t.float :franchisee_cost
      t.timestamps
    end
  end
end
