

class GroupUser < ApplicationRecord
  belongs_to :user
  belongs_to :group


  validates :one_word, length: { maximum: 20, message: "(一言)は20文字以下で入力してください" }
end
