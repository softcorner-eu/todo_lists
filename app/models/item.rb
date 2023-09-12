class Item < ApplicationRecord
  validates :content, presence: true

  belongs_to :list
end