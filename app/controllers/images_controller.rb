class ImagesController < ApplicationController #:nodoc:
  def new
    @index = params[:index].to_i
    @trail = Trail.new
    @trail.images.build
    render layout: false
  end
end
