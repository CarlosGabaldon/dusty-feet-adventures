require 'rails_helper'

RSpec.feature "Users can create trails" do
  let(:user){ create(:user, :admin) }

  before do
    login_as user
    visit "/"
    click_link "Add new trail"
  end
  scenario "with valid attributes" do
    fill_in "Name", with: "Bright Angel Trail"
    fill_in "Description", with: "A very busy trail that runs to the river."
    select "Arizona"
    click_button "Add Trail"

    expect(page).to have_content "Trail Added."

    within("#attributes") do
      expect(page).to have_content "Author: #{user.email}"
    end

  end

  scenario "without valid attributes" do
    click_button "Add Trail"

    expect(page).to have_content "Trail not Added."
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Description can't be blank"
  end

  scenario "with images", js: true do
    fill_in "Name", with: "Arizona Trail"
    fill_in "Description", with: "A trail that runs from Mexico to Utah"
    select "Arizona"
    fill_in "Url #1", with: "http://www.aztrail.org/images/washingtonpark.jpg"
    click_link "Add another image"
    fill_in "Url #2", with: "http://www.aztrail.org/images/mulesgrandcanyon.jpg"
    click_button "Add Trail"

    expect(page).to have_content "Trail Added."
  end

  scenario "with GPX file" do
    fill_in "Name", with: "JMT"
    fill_in "Description", with: "The iconic trail"
    select "California"
    attach_file "gpx_file", "#{Rails.root}/spec/fixtures/trail_gpx.xml"
    click_button "Add Trail"

    expect(page).to have_content "Trail Added."
  end

  scenario "with associated tags" do
    fill_in "Name", with: "JMT"
    fill_in "Description", with: "The iconic trail"
    select "California"
    fill_in "Tags", with: "advanced beautiful"
    click_button "Add Trail"

    expect(page).to have_content "Trail Added."
    within "#tags" do
      expect(page).to have_content "advanced"
      expect(page).to have_content "beautiful"
    end

  end

  scenario "when clicking cancel return to trail listing" do
    click_link "Cancel"

    expect(page.current_url).to eq trails_url
  end
end
