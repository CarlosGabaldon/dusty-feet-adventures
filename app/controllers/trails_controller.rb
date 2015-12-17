class TrailsController < ApplicationController
  include Uploadable
  before_action :build_lookups

  def index
    @trails = Trail.all
  end

  def show
    @trail = Trail.find(params[:id])
    @gmap = GoogleMaps.new(@trail.location.lat_long_coords, @trail.route)
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

  def update
    @trail = Trail.find(params[:id])
    if file_path = process_gpx
      @trail.gpx_file_path = file_path
    end

    if @trail.update(trail_params)
      flash[:notice] = "Trail Updated."
      redirect_to @trail
    else
      flash[:alert] = "Trail not Updated."
      build_lookups
      render 'edit'
    end
  end

  def create
    @trail = Trail.new(trail_params)
    @trail.gpx_file_path = process_gpx

    if @trail.save
      flash[:notice] = "Trail Added."
      redirect_to @trail
    else
      flash[:alert] = "Trail not Added."
      build_lookups
      render 'new'
    end
  end

  ## Filter actions ##
  def location
    @state = params[:state]
    @trails = Trail.in_state(@state)
    render 'index'
  end

  private
  def trail_params
    params.require(:trail).permit(:name, :description, :route, :gpx_file,
      location_attributes: [:id, :lat_long_coords, :state],
      images_attributes: [:id, :url])
  end

  def process_gpx
    upload_file(params[:gpx_file]) if params[:gpx_file]
  end

  def build_lookups
    @states = LookUp::STATES
  end

  def build_images
    4.times {@trail.images.build}
  end
end
