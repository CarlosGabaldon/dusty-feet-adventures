require 'rails_helper'

RSpec.feature "Users can create trails" do
  scenario "with valid attributes" do
    visit "/"
    click_link "Add new trail"

    fill_in "Name", with: "Bright Angel Trail"
    fill_in "Description", with: "A very busy trail that runs to the river."
    click_button "Add Trail"

    expect(page).to have_content "Trail Added."

  end
end
