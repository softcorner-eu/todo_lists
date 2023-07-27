class TodoItemsController < ApplicationController
  def create
    binding.pry
    @todo_item = TodoItem.new todo_item_params
    if @todo_item.save
      binding.pry
    else
      render 'todo_lists/show'
    end
  end

  private

  def todo_item_params
    params.require(:todo_item)
          .permit(:content)
  end

end