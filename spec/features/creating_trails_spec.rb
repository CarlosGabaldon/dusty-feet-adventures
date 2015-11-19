require 'rails_helper'

RSpec.feature "Users can create trails" do
  before do
    visit "/"
    click_link "Add new trail"
  end
  scenario "with valid attributes" do
    fill_in "Name", with: "Bright Angel Trail"
    fill_in "Description", with: "A very busy trail that runs to the river."
    click_button "Add Trail"

    expect(page).to have_content "Trail Added."

  end

  scenario "without valid attributes" do
    click_button "Add Trail"

    expect(page).to have_content "Trail not Added."
    expect(page.current_url).to eq new_trail_url
  end
end
