class List < ApplicationRecord
  validates :name, presence: true

  enum color_theme: { primary: "blue",
                     secondary: "grey",
                     success: "green",
                     danger: "red",
                     warning: "yellow",
                     info: "cyan",
                     light: "white",
                     dark: "black" }

  enum tags: [:daily, :important, :family, :work, :privy]

  has_many :items

  accepts_nested_attributes_for :items, reject_if: :all_blank

  def self.human_enum_name(enum_name, enum_value)
    I18n.t("activerecord.attributes.#{model_name.i18n_key}.#{enum_name.to_s.pluralize}.#{enum_value}")
  end
end