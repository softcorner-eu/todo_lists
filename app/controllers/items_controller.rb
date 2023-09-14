class ItemsController < ApplicationController

  before_action do
    @list = List.find(params[:todo_list_id])
  end

  def new
    @item = @list.items.build
  end

  def create
    @item = @list.items.create item_params
    respond_with @list
  end

  private

  def item_params
    params.require(:item)
          .permit(:content)
  end

end