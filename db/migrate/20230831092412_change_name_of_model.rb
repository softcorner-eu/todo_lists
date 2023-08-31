class ChangeNameOfModel < ActiveRecord::Migration[5.2]
  def change
    rename_table :todo_lists, :lists
    rename_column :todo_items, :todo_list_id, :list_id
    rename_table :todo_items, :items
  end
end
