class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.integer :owder_id
      t.string :name
      t.text :introduction
      t.string :group_key

      t.timestamps
    end
  end
end
