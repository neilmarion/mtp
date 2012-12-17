class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :last_name
      t.string :first_name
      t.string :middle_name
      t.string :birth_date
      t.integer :office_id
      t.integer :organization_id

      t.timestamps
    end
  end
end
