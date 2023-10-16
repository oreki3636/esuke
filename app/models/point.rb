# frozen_string_literal: true

class Point < ApplicationRecord
  belongs_to :todolist
  belongs_to :user
end
