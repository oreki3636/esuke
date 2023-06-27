class Todolist < ApplicationRecord
  has_many :points
  belongs_to :user

  validates :list, presence: true
end
