class TodoList < ApplicationRecord
  validates :name, presence: true

  enum color_theme: [:primary, :secondary, :success, :danger, :warning, :info, :light, :dark]

  has_many :todo_items

  accepts_nested_attributes_for :todo_items, reject_if: :all_blank

  def self.human_enum_name(enum_name, enum_value)
    I18n.t("activerecord.attributes.#{model_name.i18n_key}.#{enum_name.to_s.pluralize}.#{enum_value}")
  end
end