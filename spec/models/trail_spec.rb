require 'rails_helper'

RSpec.describe Trail, type: :model do
  it "is valid with name, description, and location" do
    trail = create(:trail_one)
    expect(trail).to be_valid
  end

  it "is invalid with name missing" do
    trail = build(:trail_missing_name)
    trail.valid?
    expect(trail.errors[:name]).to include("can't be blank")
  end

  it "is valid when 5 images are added" do
    trail = create(:trail_with_images)
    expect(trail.images.count).to eq 5
  end

  it "has an in_state scope to filter trails by state" do
    all_trails = [create(:trail_with_CA_location), create(:trail_one)]
    filtered_trails = Trail.in_state('CA')
    expect(filtered_trails.length).to eq 1
    expect(filtered_trails[0].location.state).to eq all_trails[0].location.state
  end
end
