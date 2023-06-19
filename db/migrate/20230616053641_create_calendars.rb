class CreateCalendars < ActiveRecord::Migration[6.1]
  def change
    create_table :calendars do |t|
      t.integer :user_id
      t.string :schedule
      t.string :todo_list
      

      t.timestamps
    end
  end
end
