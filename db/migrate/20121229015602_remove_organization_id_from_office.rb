class RemoveOrganizationIdFromOffice < ActiveRecord::Migration
  def up
    remove_column :offices, :organization_id
  end

  def down
    add_column :offices, :organization_id, :integer
  end
end
