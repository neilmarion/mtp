class RemoveOfficeIdFromPerson < ActiveRecord::Migration
  def up
    remove_column :people, :office_id
  end

  def down
    add_column :people, :office_id, :integer
  end
end
