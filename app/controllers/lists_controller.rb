class ListsController < ApplicationController

  before_action only: [:update, :edit, :show] do
    @list = List.find(params[:id])
  end

  def index
    @q = List.ransack(params[:q])
    @lists = @q.result(distinct: true)
  end

  def show
    @item = @list.items.build
  end

  def new
    @list = List.new
    @list.items.build
  end

  def create
    @list = List.create list_params
    @item = @list.items.build
    respond_with @list
  end

  def edit ; end

  def update
    @list.update list_params
    respond_with @list
  end

  private

  def list_params
    params.require(:list)
          .permit(:name, :description, :color_theme, :tags, items_attributes: [:id, :content]
          )
  end
end
