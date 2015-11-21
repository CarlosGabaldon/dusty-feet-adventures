require 'rails_helper'

RSpec.describe Trail, type: :model do
  it "is valid with name and description" do
    trail = FactoryGirl.create(:trail_one)
    expect(trail).to be_valid
  end

  it "is invalid with name missing" do
    trail = FactoryGirl.build(:trail_missing_name)
    trail.valid?
    expect(trail.errors[:name]).to include("can't be blank")
  end
end
