# frozen_string_literal: true

class CreateGroupUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :group_users do |t|
      t.references :user, index: true, foreign_key: true
      t.references :group, index: true, foreign_key: true
      # group_userですがt.references :user, index: true, foreign_key: trueのように
      # 記述することで自動的に外部キーとしてuserを持たせることができます。groupも同様です。

      t.timestamps
    end
  end
end
