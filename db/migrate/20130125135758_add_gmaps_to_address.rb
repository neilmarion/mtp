class AddGmapsToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :gmaps, :boolean
  end
end
