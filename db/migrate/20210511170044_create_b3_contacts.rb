class CreateB3Contacts < ActiveRecord::Migration[5.2]
  def change
    create_table :b3_contacts do |t|
      t.references :b1_permits, index: true, foreign_key: true
      t.boolean :b3_primary_flag
      t.string :b3_contact_type
      t.string :b3_fname
      t.string :b3_lname
      t.integer :b3_phone
      t.integer :b3_email
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
