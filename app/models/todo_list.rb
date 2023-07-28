class TodoList < ApplicationRecord
  validates :name, presence: true

  has_many :todo_items

  accepts_nested_attributes_for :todo_items, reject_if: :all_blank
end