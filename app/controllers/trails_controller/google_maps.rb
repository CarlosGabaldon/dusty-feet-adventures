class TrailsController
  class GoogleMaps
    attr_reader :parameters
    attr_reader :geocode

    def initialize(geocode)
      @geocode = geocode
      @parameters = {
        url: Rails.configuration.x.google_maps_static_api,
        api_key: "key=#{Rails.configuration.x.google_api_key}",
        center: "center=#{@geocode}",
        autoscale: "autoscale=false",
        size: "size=600x300",
        zoom: "zoom=14",
        scale: "scale=false",
        map_type: "maptype=hybrid",
        format: "format=png",
        visual_refresh: "visual_refresh=true",
        markers: "markers=size:mid%7Ccolor:0xff0000%7Clabel:1%7C#{@geocode}",

      }

    end

    def static_map_uri
      uri = "#{@parameters[:url]}#{@parameters[:autoscale]}&#{@parameters[:size]}"
      uri << "&#{@parameters[:map_type]}&#{@parameters[:format]}"
      uri << "&#{@parameters[:visual_refresh]}&#{@parameters[:markers]}"
      uri << "&#{@parameters[:api_key]}"
    end

    def maps_url
      "http://maps.google.com/?q=#{@geocode}"
    end
  end
end
