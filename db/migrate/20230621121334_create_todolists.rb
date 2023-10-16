# frozen_string_literal: true

class CreateTodolists < ActiveRecord::Migration[6.1]
  def change
    create_table :todolists do |t|
      t.integer :user_id
      t.string :list
      t.boolean :check, default: false
      t.date :date # データを明日のカレンダーに挿入するカラム
      t.datetime :completed_datetime
      t.timestamps
    end
  end
end
