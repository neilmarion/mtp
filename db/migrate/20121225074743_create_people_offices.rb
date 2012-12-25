class CreatePeopleOffices < ActiveRecord::Migration
  def change
    create_table :people_offices do |t|
      t.integer :person_id
      t.integer :office_id

      t.timestamps
    end
  end
end
