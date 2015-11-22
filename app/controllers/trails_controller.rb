class TrailsController < ApplicationController
  def index
    @trails = Trail.all
  end

  def show
    @trail = Trail.find(params[:id])
  end

  def new
    @trail = Trail.new
    @trail.build_location
  end

  def edit
    @trail = Trail.find(params[:id])
  end

  def update
    @trail = Trail.find(params[:id])

    if @trail.update(trail_params)
      flash[:notice] = "Trail Updated."
      redirect_to @trail
    else
      flash[:alert] = "Trail not Updated."
      render 'edit'
    end
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
    params.require(:trail).permit(:name, :description,
      location_attributes: [:id, :geocode])
  end

end
