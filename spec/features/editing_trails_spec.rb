require 'rails_helper'

RSpec.feature "Users can edit trails" do
  before do
    @trail = FactoryGirl.create(:trail_one)
    visit "/"
    click_link @trail.name
    click_link "Edit Trail"
  end

  scenario "with valid attributes" do
    fill_in "Name", with: "Trail three"
    fill_in "Description", with: "Trail one description updated."
    click_button "Update Trail"

    expect(page).to have_content "Trail Updated."
    expect(page).to have_content "Trail three"
  end

  scenario "with invalid attributes" do
    fill_in "Name", with: ""
    click_button "Update Trail"
    expect(page).to have_content "Name can't be blank"
  end

  scenario "with when clicking cancel return to trail detail" do
    click_link "Cancel"
    expect(page.current_url).to eq trail_url(@trail)
  end

end
