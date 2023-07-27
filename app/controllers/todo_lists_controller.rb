class TodoListsController < ApplicationController
  def index
    @todo_lists = TodoList.all
  end

  def show
    @todo_list = TodoList.find(params[:id])
    @todo_item = TodoItem.new
  end

  def new
    @todo_list = TodoList.new
  end

  def create
    @todo_list = TodoList.new todo_list_params
    if @todo_list.save
      redirect_to todo_list_path(@todo_list)
    else
      render :new
    end
  end

  def edit
    @todo_list = TodoList.find(params[:id])
  end

  def update
    @todo_list = TodoList.find(params[:id])
    @todo_list.assign_attributes todo_list_params
    if @todo_list.save
      redirect_to todo_list_path(@todo_list)
    else
      render :edit
    end
  end

  private

  def todo_list_params
    params.require(:todo_list)
          .permit(:name, :description)
  end
end
