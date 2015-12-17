require 'rails_helper'

RSpec.feature "Users can create trails" do
  before do
    visit "/"
    click_link "Add new trail"
  end
  scenario "with valid attributes" do
    fill_in "Name", with: "Bright Angel Trail"
    fill_in "Description", with: "A very busy trail that runs to the river."
    select "Arizona"
    fill_in "Lat long coords", with: "34.575597, -112.427461"
    fill_in "Route", with: "34.549089, -112.537448|34.551259, -112.535793"
    click_button "Add Trail"

    expect(page).to have_content "Trail Added."

  end

  scenario "without valid attributes" do
    click_button "Add Trail"

    expect(page).to have_content "Trail not Added."
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Description can't be blank"
  end

  scenario "with GPX file" do
    fill_in "Name", with: "JMT"
    fill_in "Description", with: "The iconic trail"
    select "California"
    fill_in "Lat long coords", with: "37.234872, -118.870606"
    attach_file "gpx_file", "#{Rails.root}/spec/fixtures/trail_gpx.xml"
    click_button "Add Trail"

    expect(page).to have_content "Trail Added."
  end

  scenario "when clicking cancel return to trail listing" do
    click_link "Cancel"

    expect(page.current_url).to eq trails_url
  end
end
