require 'rails_helper'

RSpec.feature "Users can create trails" do
  before do
    visit "/"
    click_link "Add new trail"
  end
  scenario "with valid attributes" do
    fill_in "Name", with: "Bright Angel Trail"
    fill_in "Description", with: "A very busy trail that runs to the river."
    select "AZ", from: "trail[location_attributes][state]"
    fill_in "Lat long coords", with: "34.575597, -112.427461"
    fill_in "Path", with: "34.549089, -112.537448|34.551259, -112.535793"
    click_button "Add Trail"

    expect(page).to have_content "Trail Added."

  end

  scenario "without valid attributes" do
    click_button "Add Trail"

    expect(page).to have_content "Trail not Added."
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Description can't be blank"
  end

  scenario "when clicking cancel return to trail listing" do
    click_link "Cancel"

    expect(page.current_url).to eq trails_url
  end
end
