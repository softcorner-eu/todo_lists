class TodoItem < ApplicationRecord
  validates :content, presence: true

  belongs_to :todo_list
end