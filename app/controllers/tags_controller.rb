class TagsController < ApplicationController
  def remove
    @trail = Trail.find(params[:trail_id])
    @tag = Tag.find(params[:id])
    @trail.tags.destroy(@tag)
    head :ok
  end
end
