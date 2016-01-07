require 'rails_helper'

RSpec.describe Location, type: :model do
  it "is valid with a state" do
    location = create(:location)
    expect(location).to be_valid
  end

  it "is invalid without a lat_long_coords" do
    location = build(:location, state: "")
    location.valid?
    expect(location.errors[:state]).to include("can't be blank")
  end
end
