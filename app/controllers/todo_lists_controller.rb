class TodoListsController < ApplicationController

  before_action only: [:update, :edit, :show] do
    @todo_list = TodoList.find(params[:id])
  end

  def index
    if params[:tag_name].present?
      @todo_lists = TodoList.joins(:tags).where(tags: {name: params[:tag_name]})
    else
      @todo_lists = TodoList.all
    end

  end

  def show
    @todo_item = @todo_list.todo_items.build
  end

  def new
    @todo_list = TodoList.new
    @todo_list.todo_items.build
    @todo_list.tags.build
  end

  def create
    @todo_list = TodoList.create todo_list_params
    @todo_list.todo_items.build

    binding.pry
    if @todo_list.save
      params[:todo_list][:tags_attributes][:name].each do |tag_name|
        tag = Tag.find_or_create_by tag_name
        @todo_list << tag
      end
    end
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
          .permit(:name, :description, :color_theme, todo_items_attributes: [:id, :content]
          )
  end
end
