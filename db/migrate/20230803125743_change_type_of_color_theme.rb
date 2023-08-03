class ChangeTypeOfColorTheme < ActiveRecord::Migration[5.2]
  def change
    change_column :todo_lists, :color_theme, :string
  end
end
