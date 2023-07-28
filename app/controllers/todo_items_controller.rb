class TodoItemsController < ApplicationController

  before_action do
    @todo_list = TodoList.find(params[:todo_list_id])
  end

  def new
    @todo_item = @todo_list.todo_items.build
  end

  def create
    @todo_item = @todo_list.todo_items.create todo_item_params
    respond_with @todo_list
  end

  private

  def todo_item_params
    params.require(:todo_item)
          .permit(:content)
  end

end