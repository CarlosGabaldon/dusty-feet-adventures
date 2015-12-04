require 'rails_helper'

RSpec.describe TrailsController::GoogleMaps do
  before do
    @marker = "34.575597, -112.427461"
    @path = "34.549089, -112.537448|34.551259, -112.535793"
    @map = TrailsController::GoogleMaps.new(@marker, @path)
  end

  it "has a properly formated map url" do
    expect(@map.map_url).to eq "http://maps.google.com/?q=#{@marker}"
  end

  it "has a properly formated map marker api uri" do
    uri = "#{@map.parameters[:url]}#{@map.parameters[:autoscale]}&#{@map.parameters[:size]}"
    uri << "&#{@map.parameters[:map_type]}&#{@map.parameters[:format]}"
    uri << "&#{@map.parameters[:visual_refresh]}&#{@map.parameters[:markers]}"
    uri << "&#{@map.parameters[:api_key]}"

    expect(@map.map_with_marker_uri).to eq uri
  end

  it "has a properly formated map path api uri" do
    uri = "#{@map.parameters[:url]}#{@map.parameters[:autoscale]}&#{@map.parameters[:size]}"
    uri << "&#{@map.parameters[:map_type]}&#{@map.parameters[:format]}"
    uri << "&#{@map.parameters[:visual_refresh]}&#{@map.parameters[:markers]}"
    uri << "&#{@map.parameters[:path]}&#{@map.parameters[:api_key]}"

    expect(@map.map_with_path_uri).to eq uri

  end
end
