class TrailsController
  class GoogleMaps
    attr_reader :parameters
    attr_reader :markers_lat_long_coords
    attr_reader :path_lat_long_coords

    def initialize(markers_lat_long_coords, path_lat_long_coords="")
      @markers_lat_long_coords = markers_lat_long_coords
      @path_lat_long_coords = path_lat_long_coords
      @parameters = {
        url: Rails.configuration.x.google_maps_static_api,
        api_key: "key=#{Rails.configuration.x.google_api_key}",
        center: "center=#{@markers_lat_long_coords}",
        autoscale: "autoscale=false",
        size: "size=600x300",
        zoom: "zoom=14",
        scale: "scale=false",
        map_type: "maptype=hybrid",
        format: "format=png",
        visual_refresh: "visual_refresh=true",
        markers: "markers=size:mid%7Ccolor:0xff0000%7Clabel:1%7C#{@markers_lat_long_coords}",
        path: "path=color:0x0000ff|weight:5|#{@path_lat_long_coords}"

      }

    end

    def map_with_marker_uri
      uri = "#{@parameters[:url]}#{@parameters[:autoscale]}&#{@parameters[:size]}"
      uri << "&#{@parameters[:map_type]}&#{@parameters[:format]}"
      uri << "&#{@parameters[:visual_refresh]}&#{@parameters[:markers]}"
      uri << "&#{@parameters[:api_key]}"
    end

    def map_with_path_uri
      uri = "#{@parameters[:url]}#{@parameters[:autoscale]}&#{@parameters[:size]}"
      uri << "&#{@parameters[:map_type]}&#{@parameters[:format]}"
      uri << "&#{@parameters[:visual_refresh]}&#{@parameters[:markers]}"
      uri << "&#{@parameters[:path]}&#{@parameters[:api_key]}"
    end

    def map_url
      "http://maps.google.com/?q=#{@markers_lat_long_coords}"
    end
  end
end
