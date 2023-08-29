class TodoListsController < ApplicationController

  before_action only: [:update, :edit, :show] do
    @todo_list = TodoList.find(params[:id])
  end

  def index
    @q = TodoList.ransack(params[:q])
    @todo_lists = @q.result(distinct: true)
  end

  def show
    @todo_item = @todo_list.todo_items.build
  end

  def new
    @todo_list = TodoList.new
    @todo_list.todo_items.build
  end

  def create
    @todo_list = TodoList.create todo_list_params
    @todo_item = @todo_list.todo_items.build
    respond_with @todo_list
  end

  def edit ; end

  def update
    @todo_list.update todo_list_params
    respond_with @todo_list
  end

  private

  def todo_list_params
    params.require(:todo_list)
          .permit(:name, :description, :color_theme, :tags,  todo_items_attributes: [:id, :content]
          )
  end
end
