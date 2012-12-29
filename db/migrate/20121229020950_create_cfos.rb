class CreateCfos < ActiveRecord::Migration
  def change
    create_table :cfos do |t|
      t.string :name

      t.timestamps
    end
  end
end
