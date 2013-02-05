class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :ancestry
      t.string :type_of_children
      t.string :address
      t.string :longitude
      t.string :latitude

      t.timestamps
    end
  end
end
