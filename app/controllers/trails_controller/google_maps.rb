class TrailsController
  class GoogleMaps
    def self.uri(geocode)
      p = {
        url: Rails.configuration.x.google_maps_static_api,
        api_key: "key=#{Rails.configuration.x.google_api_key}",
        center: "center=#{geocode}",
        autoscale: "autoscale=false",
        size: "size=600x300",
        zoom: "zoom=14",
        scale: "scale=false",
        map_type: "maptype=hybrid",
        format: "format=png",
        visual_refresh: "visual_refresh=true",
        markers: "markers=size:mid%7Ccolor:0xff0000%7Clabel:1%7C#{geocode}",

      }
      url = "#{p[:url]}#{p[:autoscale]}&#{p[:size]}&#{p[:map_type]}&#{p[:format]}"
      url << "&#{p[:visual_refresh]}&#{p[:markers]}&#{p[:api_key]}"
    end
  end
end
