class AddOrganizationIdToOffice < ActiveRecord::Migration
  def change
    add_column :offices, :organization_id, :integer
  end
end
