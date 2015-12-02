require 'rails_helper'

RSpec.feature "Users should be able to view trail details" do
  scenario "when visting the show page" do
    trail = create(:trail)
    visit '/'
    click_link trail.name
    expect(page).to have_content trail.name
    expect(page).to have_content trail.description
    expect(page).to have_content trail.location.geocode
    expect(page).to have_css "img[id*='map_#{trail.id}']"
    expect(page).to have_css "a[href*='#{trail.location.geocode}']"

  end

  scenario "when visting the show page with images" do
    trail = create(:trail_with_images)
    visit '/'
    click_link trail.name
    expect(page).to have_css "img[src='#{trail.images[0].url}']"
  end

  scenario "when visting the show page with a trail path" do
    trail = create(:trail_with_path)
    visit '/'
    click_link trail.name
    expect(page).to have_css "img[src*='#{trail.path}']"

  end

  scenario "when clicking 'all' view trail listing page" do
    trail = create(:trail)
    visit '/'
    click_link trail.name
    click_link "All Trails"
    expect(page.current_url).to eq trails_url
  end

end
