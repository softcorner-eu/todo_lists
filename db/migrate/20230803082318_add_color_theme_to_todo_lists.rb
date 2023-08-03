class AddColorThemeToTodoLists < ActiveRecord::Migration[5.2]
  def change
    add_column :todo_lists, :color_theme, :integer
  end
end
