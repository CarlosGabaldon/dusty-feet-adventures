class TrailsController < ApplicationController #:nodoc:
  include Uploadable
  before_action :build_lookups
  before_action :auth_admin!, only: [:new, :edit, :create, :update, :destroy]

  def index
    @trails = Trail.all
  end

  def show
    @trail = Trail.find(params[:id])
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
    @trail.author = current_user
    process_gpx!

    if @trail.save
      flash[:notice] = 'Trail Added.'
      redirect_to @trail
    else
      flash[:alert] = 'Trail not Added.'
      build_lookups
      render 'new'
    end
  end

  def update
    @trail = Trail.find(params[:id])
    process_gpx!

    if @trail.update(trail_params)
      flash[:notice] = 'Trail Updated.'
      redirect_to @trail
    else
      flash[:alert] = 'Trail not Updated.'
      build_lookups
      render 'edit'
    end
  end

  def destroy
    @trail = Trail.find(params[:id])
    @trail.destroy

    flash[:notice] = 'Trail Deleted'
    redirect_to trails_path
  end

  ## Filter actions ##
  def location
    @state = params[:state]
    @trails = Trail.in_state(@state)
    render 'index'
  end

  def search
    if params[:search].present?
      @trails = Trail.search(params[:search])
    else
      @trails = Trail.all
    end
    render 'index'
  end

  private

  def auth_admin!
    authenticate_user!
    return false if current_user.admin?
    redirect_to root_path, alert: 'You must be an admistrator to access.'
  end

  def trail_params
    params.require(:trail).permit(
      :name,
      :description, :gpx_file, :tag_names,
      location_attributes: [:id, :state],
      images_attributes: [:id, :url])
  end

  # Converts the uploaded GPX file to trail route of JSON objects.
  def process_gpx!
    trail_gpx_processor = TrailGPXProcessor.new(@trail)
    trail_gpx_processor.process_route!(TrailsController::GPX, upload_gpx)
  end

  # Uses the Uploadable concern to save to the file system
  def upload_gpx
    upload_file(params[:gpx_file]) if params[:gpx_file]
  end

  def build_lookups
    @states = LookUp::STATES
  end

  def build_images
    @trail.images.build
  end
end
