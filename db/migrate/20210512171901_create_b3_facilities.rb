class CreateB3Facilities < ActiveRecord::Migration[5.2]
  def change
    create_table :b3_facilities do |t|
      t.integer :b3_street_number
      t.string :b3_street_prefix
      t.string :b3_street_name
      t.string :b3_street_type
      t.string :b3_unit_info
      t.string :b3_city
      t.string :b3_state
      t.integer :b3_zip
      t.boolean :b3_has_co
      t.timestamps
    end
  end
end
