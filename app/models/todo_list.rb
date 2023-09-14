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
  has_and_belongs_to_many :users

  accepts_nested_attributes_for :todo_items, reject_if: :all_blank
  accepts_nested_attributes_for :tags, reject_if: :all_blank, allow_destroy: true

  def tag_names
    tags.pluck(:name)
  end

  # def tag_names=(tag_names_array)
  #   tags.each do |tag|
  #     tag.destroy unless tag.name.in?(tag_names_array)
  #   end
  #   tag_names_array.each do |tag_name|
  #     tags.build(name: tag_name) unless tags.find {|t| t.name == tag_name }
  #   end
  # end

  def tag_names= tag_names = []
    attrs = []

    tag_names.each do |tag_name|
      if tag = tags.detect{|tag| tag.name == tag_name}
        attrs << { id: tag.id }
      else
        attrs << { id: nil, name: tag_name }
      end
    end

    tags.reject{|tag| tag_names.include?(tag.name) }.each do |tag|
      attrs << { id: tag.id, _destroy: true }
    end

    self.tags_attributes= attrs
  end


  def self.human_enum_name(enum_name, enum_value)
    I18n.t("activerecord.attributes.#{model_name.i18n_key}.#{enum_name.to_s.pluralize}.#{enum_value}")
  end
end
