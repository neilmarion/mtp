class AddLatitudeAndLongitudeToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :latitude, :float, :limit => 50
    add_column :addresses, :longitude, :float, :limit => 50
  end
end
