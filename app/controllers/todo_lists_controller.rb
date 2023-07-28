class TodoListsController < ApplicationController

  before_action only: [:update, :edit, :show] do
    @todo_list = TodoList.find(params[:id])

  end

  def index
    @todo_lists = TodoList.all
  end

  def show ; end

  def new
    @todo_list = TodoList.new
  end

  def create
    binding.pry
    @todo_list = TodoList.new todo_list_params
    if @todo_list.save
      respond_with @todo_list
    else
      render :new
    end
  end

  def edit ; end

  def update
    @todo_list.assign_attributes todo_list_params
    if @todo_list.save
      respond_with @todo_list
    else
      render :edit
    end
  end

  private

  def todo_list_params
    params.fetch(:todo_list)
          .permit(:name, :description, todo_items_attributes: [:content])
  end
end
