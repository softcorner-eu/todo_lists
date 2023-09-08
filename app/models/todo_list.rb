class TodoList < ApplicationRecord
  validates :name, presence: true

  enum color_theme: { primary: "blue",
                     secondary: "grey",
                     success: "green",
                     danger: "red",
                     warning: "yellow",
                     info: "cyan",
                     light: "white",
                     dark: "black" }

  has_many :todo_items, dependent: :destroy
  has_and_belongs_to_many :tags

  accepts_nested_attributes_for :todo_items, reject_if: :all_blank
  accepts_nested_attributes_for :tags, reject_if: :all_blank, :allow_destroy => true

  def tag_names
    tags.pluck(:name)
  end

  def tag_names=(tag_names_array)
    tag_names_array.each do |tag_name|
      tag = Tag.find_or_create_by(name: tag_name)
      tags.build tag
    end
  end

  def self.human_enum_name(enum_name, enum_value)
    I18n.t("activerecord.attributes.#{model_name.i18n_key}.#{enum_name.to_s.pluralize}.#{enum_value}")
  end
end