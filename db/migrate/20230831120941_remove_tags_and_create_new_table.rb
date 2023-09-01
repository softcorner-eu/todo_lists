class RemoveTagsAndCreateNewTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :todo_lists, :tags, :integer
    create_table :tags do |c|
      c.string :name
      c.timestamp
    end
    create_join_table :todo_lists, :tags
  end
end
