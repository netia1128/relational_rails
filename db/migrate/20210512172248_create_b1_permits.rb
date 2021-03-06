class CreateB1Permits < ActiveRecord::Migration[5.2]
  def change
    create_table :b1_permits do |t|
      t.belongs_to :b3_facility, index: true, foreign_key: true
      t.string :b1_special_text
      t.string :b1_appl_status
      t.string :b1_per_sub_type
      t.datetime :b1_expiration
      t.boolean :b1_extraction
      t.integer :b1_plant_count
      t.timestamps
    end
  end
end
