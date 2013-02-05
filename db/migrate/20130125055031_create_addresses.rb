class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :address
      t.integer :person_id
      t.string :longitude
      t.string :latitude

      t.timestamps
    end
  end
end
