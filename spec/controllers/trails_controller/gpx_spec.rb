require 'rails_helper'

RSpec.describe TrailsController::GPX, type: :model do
  before do
    @route = "34.549009, -112.536735|"
    @route << "34.550168, -112.536752|"
    @route << "34.550480, -112.536408|"
    @route << "34.551081, -112.535954|"
    @route << "34.551267, -112.535701|"
    @route << "34.551143, -112.535205|"
    @route << "34.550753, -112.535149|"
    @route << "34.550178, -112.535351|"
    @route << "34.549646, -112.536022|"
    @route << "34.549009, -112.536735"

    @file_path = "#{Rails.root}/spec/fixtures/trail_gpx.xml"
    @gpx = TrailsController::GPX.new(file_path: @file_path)
  end

  it "has a file path" do
    expect(@gpx.file_path).to eq @file_path
  end

  it "parses gpx file to a route (lat_long coords)" do
    expect(@gpx.parse_to_route).to eq @route
  end
end
