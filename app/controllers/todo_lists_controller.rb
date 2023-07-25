class TodoListsController < ApplicationController
  def index; end

  def show; end

  def new
    @todo_list = TodoList.new
  end

  def create
    binding.pry
    redirect_to :todo_lists
  end

  def update; end

  def destroy; end

end
