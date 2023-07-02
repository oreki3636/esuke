class Todolist < ApplicationRecord
  # has_many :points, dependent: :destroy
  has_many :points, dependent: :destroy


  belongs_to :user

  validates :list, presence: true
end
