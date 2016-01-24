require 'rails_helper'

RSpec.describe Trail, type: :model do
  let(:trail) {create(:trail)}

  it "is valid with name, description, and location" do
    expect(trail).to be_valid
  end

  it "is invalid with name missing" do
    trail = build(:trail, name: ' ')
    trail.valid?
    expect(trail.errors[:name]).to include("can't be blank")
  end

  it "is valid when 5 images are added" do
    trail = create(:trail_with_images)
    expect(trail.images.count).to eq 5
  end

  it "has an in_state scope to filter trails by state" do
    all_trails = [create(:trail_with_CA_location), create(:trail)]
    filtered_trails = Trail.in_state('CA')
    expect(filtered_trails.length).to eq 1
    expect(filtered_trails[0].location.state).to eq all_trails[0].location.state
  end

  it "tag_names virtual attribute updates tags" do
    trail.tag_names = "adavanced fun"
    expect(trail.tags.count).to eq 2
  end

  it "tag_names virtual attribute does not add duplicates tags" do
    trail.tag_names = "advanced advanced fun"
    expect(trail.tags.count).to eq 2
  end

  it "tag_names virtual attribute returns string of tags" do
    trail.tags << create(:tag, name: "advanced")
    trail.tags << create(:tag, name: "fun")
    expect(trail.tag_names).to eq "advanced fun "
  end
end
