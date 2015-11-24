class TrailsController < ApplicationController
  def index
    @trails = Trail.all
  end

  def show
    @trail = Trail.find(params[:id])
    @map_uri = build_map_uri(@trail.location.geocode)
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

  def build_map_uri(geocode)
    url = Rails.configuration.x.google_maps_static_api
    api_key = "key=#{Rails.configuration.x.google_api_key}"
    center = "center=#{geocode}"
    zoom = "zoom=14&scale=false&size=600x300"
    map_type = "maptype=roadmap"
    format = "format=png"
    visual_refresh = "visual_refresh=true"
    markers = "markers=size:mid%7Ccolor:0xff0000%7Clabel:1%7C#{geocode}"

    "#{url}#{center}&#{zoom}&#{map_type}&#{format}&#{visual_refresh}&#{markers}&#{api_key}"
  end

end
