class CreatePoints < ActiveRecord::Migration[6.1]
  def change
    create_table :points do |t|
      t.integer :user_id
      t.integer :todolist_id
      t.boolean :done_flg, default: false

      t.timestamps
    end
  end
end
