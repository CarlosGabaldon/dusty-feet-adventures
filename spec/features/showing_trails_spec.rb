require 'rails_helper'

RSpec.feature "Users should be able to view trail details" do
  before do
    @trail = create(:trail_with_images)
    visit '/'
    click_link @trail.name
  end
  scenario "when visting the show page" do
    expect(page).to have_content @trail.name
    expect(page).to have_content @trail.description
    expect(page).to have_content @trail.location.geocode
    expect(page).to have_css "img[id*='map_#{@trail.id}']"
    expect(page).to have_css "a[href*='#{@trail.location.geocode}']"
    expect(page).to have_css "img[src='#{@trail.images[0].url}']"
  end

  scenario "when clicking 'all' view trail listing page" do
    click_link "All Trails"
    expect(page.current_url).to eq trails_url
  end

end
