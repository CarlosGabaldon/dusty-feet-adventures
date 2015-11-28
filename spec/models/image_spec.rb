require 'rails_helper'

RSpec.describe Image, type: :model do
  it "is valid with url" do
    image = create(:image)
    expect(image).to be_valid
  end

  it "is invalid without url" do
    image = build(:image, url: "")
    image.valid?
    expect(image.errors[:url]).to include("can't be blank")
  end
end
