class AddCfoIdToPerson < ActiveRecord::Migration
  def change
    add_column :people, :cfo_id, :integer
  end
end
