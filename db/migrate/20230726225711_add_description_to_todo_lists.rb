class AddDescriptionToTodoLists < ActiveRecord::Migration[5.2]
  def change
    add_column :todo_lists, :description, :string
  end
end
