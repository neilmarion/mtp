class AddAncestryToOrganization < ActiveRecord::Migration
  def change
    add_column :organizations, :ancestry, :string
  end
end
