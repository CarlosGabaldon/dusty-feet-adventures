require "rails_helper"

RSpec.feature "Users can view trail listings" do
  before do
    @trails = [create(:trail_with_images), create(:trail_two)]
  end

  scenario "when visting the home page" do
    visit "/"
    expect(page).to have_content "Trails"
    expect(page).to have_selector "li", count: 2
    expect(page).to have_content @trails.first.name
    expect(page).to have_css "img[src='#{@trails.first.images.first.url}']"
  end
end
