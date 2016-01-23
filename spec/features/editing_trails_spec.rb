require 'rails_helper'

RSpec.feature "Users can edit trails" do
  before do
    login_as create(:user, :admin)
    @trail = create(:trail)
    @trail.tags << create(:tag, name: "advanced")
    @trail.tags << create(:tag, name: "fun")
    @trail.save
    visit "/"
    click_link @trail.name
    click_link "Edit Trail"
  end

  scenario "with valid attributes" do
    fill_in "Name", with: "Trail three"
    fill_in "Description", with: "Trail one description updated."
    select "Arizona", from: "trail[location_attributes][state]"
    click_button "Update Trail"

    expect(page).to have_content "Trail Updated."
    expect(page).to have_content "Trail three"
  end

  scenario "with invalid attributes" do
    fill_in "Name", with: " "
    click_button "Update Trail"
    expect(page).to have_content "Name can't be blank"
  end

  scenario "with updating a gpx file" do
    attach_file "gpx_file", "#{Rails.root}/spec/fixtures/trail_gpx.xml"
    click_button "Update Trail"
    expect(page).to have_content "Trail Updated"
  end

  scenario "by adding an additional tag" do
    fill_in "Tags", with: "beautiful"
    click_button "Update Trail"
    within "#tags" do
      expect(page).to have_content "advanced"
      expect(page).to have_content "fun"
      expect(page).to have_content "beautiful"
    end
  end

  scenario "adding same tag name does not add duplicates" do
    fill_in "Tags", with: "advanced"
    click_button "Update Trail"
    within "#tags" do
      expect(page).to have_content "advanced"
      expect(page).to have_content "fun"
    end
  end

  scenario "with when clicking cancel return to trail detail" do
    click_link "Cancel"
    expect(page.current_url).to eq trail_url(@trail)
  end

end
