require 'rails_helper'

RSpec.describe TrailGPXProcessor, type: :model do
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
  end
  it "has process_route!" do
    gpx_file_path = "#{Rails.root}/spec/fixtures/trail_gpx.xml"
    trail = create(:trail_with_CA_location)
    trail_gpx_processor = TrailGPXProcessor.new(trail)
    trail_gpx_processor.process_route!(TrailsController::GPX, gpx_file_path)
    expect(trail.route).to eq @route
    expect(trail.location.lat_long_coords).to eq @route_start_point
  end
end
