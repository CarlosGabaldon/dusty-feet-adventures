class TrailsController < ApplicationController
  def index
    @trails = Trail.all
  end

  def show
    @trail = Trail.find(params[:id])
  end

  def new
    @trail = Trail.new
  end

  def create
    @trail = Trail.new(trail_params)

    if @trail.save
      flash[:notice] = "Trail Added."
      redirect_to @trail
    else
      flash[:alert] = "Trail not Added."
      render 'new'
    end
  end

  private
  def trail_params
    params.require(:trail).permit(:name, :description)
  end

end
