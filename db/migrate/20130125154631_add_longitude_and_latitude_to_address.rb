class AddLongitudeAndLatitudeToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :longitude, :string
    add_column :addresses, :latitude, :string
  end
end
