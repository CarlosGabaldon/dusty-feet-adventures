require 'rails_helper'

RSpec.feature "Users can edit trails" do
  before do
    @trail = FactoryGirl.create(:trail_one)
  end
  scenario "with valid attributes" do
    visit "/"
    click_link @trail.name
    click_link "Edit Trail"

    fill_in "Name", with: "Trail three"
    fill_in "Description", with: "Trail one description updated."
    click_button "Update Trail"

    expect(page).to have_content "Trail Updated."
    expect(page).to have_content "Trail three"
  end

end
