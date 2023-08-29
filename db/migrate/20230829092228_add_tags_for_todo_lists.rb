class AddTagsForTodoLists < ActiveRecord::Migration[5.2]
  def change
    add_column :todo_lists, :tags, :integer
  end
end
