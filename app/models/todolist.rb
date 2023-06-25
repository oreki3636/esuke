class Todolist < ApplicationRecord
  has_many :points
  belongs_to :user
end
