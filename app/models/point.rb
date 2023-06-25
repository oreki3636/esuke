class Point < ApplicationRecord
  belongs_to :todolist
  belongs_to :user
end
