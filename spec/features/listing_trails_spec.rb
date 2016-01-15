require "rails_helper"

RSpec.feature "Users can view trail listings" do
  before do
    @trails = [create(:trail_with_images), create(:trail_two)]
  end

  scenario "when visting the home page" do
    visit "/"
    expect(page).to have_content "Trails"
    expect(page).to have_selector 'h2', :text => 'Trail one'
    expect(page).to have_selector 'h2', :text => 'Trail two'
    expect(page).to have_content @trails.first.name
    expect(page).to have_css "img[src='#{@trails.first.images.first.url}']"
    expect(page).to have_no_selector :link_or_button, "Add new trail"
  end

  scenario "by filtering by state" do
    visit "/"
    click_link "Arizona"
    expect(page).to have_content "State: AZ"
  end
end
