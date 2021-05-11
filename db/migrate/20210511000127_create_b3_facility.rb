class CreateB3Facility < ActiveRecord::Migration[5.2]
  def change
    create_table :b3_facilities do |t|
      t.integer :b3_street_number
    end
  end
end
