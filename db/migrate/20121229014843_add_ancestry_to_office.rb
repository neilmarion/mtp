class AddAncestryToOffice < ActiveRecord::Migration
  def change
    add_column :offices, :ancestry, :string
  end
end
