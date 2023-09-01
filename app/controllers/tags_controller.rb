class TagsController < ApplicationController
  def destroy
    @tag = Tag.find(params[:id])
    @tag.delete
  end
end