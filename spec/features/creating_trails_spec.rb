require 'rails_helper'

RSpec.feature "Users can create trails" do
  before do
    visit "/"
    click_link "Add new trail"
  end
  scenario "with valid attributes" do
    fill_in "Name", with: "Bright Angel Trail"
    fill_in "Description", with: "A very busy trail that runs to the river."
    fill_in "Geocode", with: "34.575597, -112.427461"
    click_button "Add Trail"

    expect(page).to have_content "Trail Added."

  end

  scenario "without valid attributes" do
    click_button "Add Trail"

    expect(page).to have_content "Trail not Added."
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Description can't be blank"
  end
end
