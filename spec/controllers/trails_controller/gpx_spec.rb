require 'rails_helper'

RSpec.describe TrailsController::GPX, type: :model do
  before do
    @route_start_point = '{"lat":34.549009,"lng":-112.536735}'
    @route = '[{"lat": 34.549009, "lng": -112.536735},'
    @route << '{"lat": 34.550168, "lng": -112.536752},'
    @route << '{"lat": 34.550480, "lng": -112.536408},'
    @route << '{"lat": 34.551081, "lng": -112.535954},'
    @route << '{"lat": 34.551267, "lng": -112.535701},'
    @route << '{"lat": 34.551143, "lng": -112.535205},'
    @route << '{"lat": 34.550753, "lng": -112.535149},'
    @route << '{"lat": 34.550178, "lng": -112.535351},'
    @route << '{"lat": 34.549646, "lng": -112.536022},'
    @route << '{"lat": 34.549009, "lng": -112.536735}]'

    @file_path = "#{Rails.root}/spec/fixtures/trail_gpx.xml"
    @gpx = TrailsController::GPX.new(file_path: @file_path)
  end

  it "has a file path" do
    expect(@gpx.file_path).to eq @file_path
  end

  it "parses gpx file to a route (JSON array of lat lng objects)" do
    expect(@gpx.parse_to_route).to eq @route
  end

  it "has route start point" do
    expect(@gpx.route_start_point).to eq @route_start_point
  end
end
