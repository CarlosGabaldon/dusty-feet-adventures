class TrailsController < ApplicationController
  include Uploadable
  before_action :build_lookups

  def index
    @trails = Trail.all
  end

  def show
    @trail = Trail.find(params[:id])
    @gmap = GoogleMaps.new(marker_coords: @trail.location.lat_long_coords,
      route_coords: @trail.route)
  end

  def new
    @trail = Trail.new
    @trail.build_location
    build_images
  end

  def edit
    build_lookups
    @trail = Trail.find(params[:id])
    build_images unless @trail.images.any?
  end

  def create
    @trail = Trail.new(trail_params)
    process_gpx

    if @trail.save
      flash[:notice] = "Trail Added."
      redirect_to @trail
    else
      flash[:alert] = "Trail not Added."
      build_lookups
      render 'new'
    end
  end

  def update
    @trail = Trail.find(params[:id])
    process_gpx

    if @trail.update(trail_params)
      flash[:notice] = "Trail Updated."
      redirect_to @trail
    else
      flash[:alert] = "Trail not Updated."
      build_lookups
      render 'edit'
    end
  end

  def destroy
    @trail = Trail.find(params[:id])
    @trail.destroy

    flash[:notice] = "Trail Deleted"
    redirect_to trails_path
  end

  ## Filter actions ##
  def location
    @state = params[:state]
    @trails = Trail.in_state(@state)
    render 'index'
  end

  private
  def trail_params
    params.require(:trail).permit(:name, :description, :gpx_file,
      location_attributes: [:id, :lat_long_coords, :state],
      images_attributes: [:id, :url])
  end

  def process_gpx
    if params[:gpx_file]
      if @trail.gpx_file_path = upload_file(params[:gpx_file])
        gpx = TrailsController::GPX.new(file_path: @trail.gpx_file_path)
        if route = gpx.parse_to_route
          @trail.route = route
        end
      end
    end
  end

  def build_lookups
    @states = LookUp::STATES
  end

  def build_images
    4.times {@trail.images.build}
  end
end
