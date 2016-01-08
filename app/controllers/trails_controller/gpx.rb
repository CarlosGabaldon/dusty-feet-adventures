class TrailsController
  # Ecapsulation class to extract out of controller GPX file parsing to a route
  # in the format of: [latitude, longitude|latitude, longitude] pairs
  # as in: "34.549089, -112.537448|34.551259, -112.535793"
  # Useage:
  #   In controller:
  #     gpx = TrailsController::GPX.new(file_path: @trail.gpx_file_path)
  #     if route = gpx.parse_to_route
  #       @trail.route = route
  #     end
  class GPX
    attr_reader :file_path
    attr_reader :route

    def initialize(file_path:)
      @file_path = file_path
    end

    def parse_to_route
      @route ||= parse_file
    end

    def route_start_point
      ActiveSupport::JSON.encode(ActiveSupport::JSON.decode(parse_to_route)[0])
    end

    private

    def parse_file
      route = ""
      if trkpts = trkpts_node
        route = build_route(trkpts)
      end
      route
    end

    def trkpts_node
      Nokogiri::XML(File.open(@file_path)).xpath('//xmlns:trkpt') if @file_path
    end

    def build_route(trkpts)
      route = '['
      trkpts.each do |trkpt|
        lat = trkpt.attr('lat')
        lng = trkpt.attr('lon')
        route << "{\"lat\": #{lat}, \"lng\": #{lng}},"
      end
      route = route[0...-1]
      route << ']'
    end
  end
end
