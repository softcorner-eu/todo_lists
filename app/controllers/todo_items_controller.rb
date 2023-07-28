class TodoItemsController < ApplicationController

  before_action do
    @todo_list = TodoList.find(params[:todo_list_id])

  end

  def new
    @todo_item = @todo_list.todo_items.build
  end

  def create
    @todo_item = @todo_list.todo_items.build todo_item_params
    if @todo_item.save
      redirect_to todo_list_path(@todo_list)
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