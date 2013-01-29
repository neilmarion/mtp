class AddFbProfileToPerson < ActiveRecord::Migration
  def change
    add_column :people, :fb_profile, :string
  end
end
