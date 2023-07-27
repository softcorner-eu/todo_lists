class TodoItemsController < ApplicationController

  def new
    @todo_item = TodoItem.new
    @todo_list_id = params[:todo_list_id]
  end

  def create
    @todo_list_id = params[:todo_list_id]
    @todo_item = TodoItem.new todo_item_params
    @todo_item.assign_attributes(todo_list_id: @todo_list_id)
    if @todo_item.save
      redirect_to todo_list_path(@todo_list_id)
    else
      render 'new'
    end
  end

  private

  def todo_item_params
    params.require(:todo_item)
          .permit(:content)
  end

end