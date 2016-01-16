# Handles the business logic of saving route details to a trail
class TrailGPXProcessor
  def initialize(trail)
    @trail = trail
  end

  def process_route!(gpx_parser, uploader)
    if @trail.gpx_file_path = uploader
      gpx = gpx_parser.new(file_path: @trail.gpx_file_path)
      if route = gpx.parse_to_route
        @trail.route = route
        @trail.location.lat_long_coords = gpx.route_start_point
      end
    end
  end
end
