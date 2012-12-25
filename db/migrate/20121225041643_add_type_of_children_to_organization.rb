class AddTypeOfChildrenToOrganization < ActiveRecord::Migration
  def change
    add_column :organizations, :type_of_children, :string
  end
end
