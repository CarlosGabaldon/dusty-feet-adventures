require 'rails_helper'

RSpec.describe Location, type: :model do
  it "is valid with a geocode" do
    location = create(:location)
    expect(location).to be_valid
  end

  it "is invalid without a gecode" do
    location = build(:location, geocode: "")
    location.valid?
    expect(location.errors[:geocode]).to include("can't be blank")
  end
end
