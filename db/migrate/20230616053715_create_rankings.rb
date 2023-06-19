class CreateRankings < ActiveRecord::Migration[6.1]
  def change
    create_table :rankings do |t|
      t.string :rank
      t.string :rank_name
      

      t.timestamps
    end
  end
end
