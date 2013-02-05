class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :last_name
      t.string :first_name
      t.string :middle_name
      t.integer :organization_id
      t.string :birth_date
      t.integer :cfo_id
      t.integer :fb_profile 

      t.timestamps
    end
  end
end
