class CreateTodoList < ActiveRecord::Migration[5.2]
  def change
    create_table :todo_lists do |t|
      t.string :name
      t.timestamp
    end
    create_table :todo_items do |t|
      t.string :content
      t.belongs_to :todo_list
      t.timestamp
    end
  end
end
