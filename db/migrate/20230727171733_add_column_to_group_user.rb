class AddColumnToGroupUser < ActiveRecord::Migration[6.1]
  def change
    add_column :group_users, :one_word, :string
  end
end
