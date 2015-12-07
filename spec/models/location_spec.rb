require 'rails_helper'

RSpec.describe Location, type: :model do
  it "is valid with a lat_long_coords" do
    location = create(:location)
    expect(location).to be_valid
  end

  it "is invalid without a lat_long_coords" do
    location = build(:location, lat_long_coords: "")
    location.valid?
    expect(location.errors[:lat_long_coords]).to include("can't be blank")
  end
end
