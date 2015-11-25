require 'rails_helper'

RSpec.feature "Users should be able to view trail details" do
  before do
    @trail = create(:trail_one)
  end
  scenario "when visting the show page" do
    visit '/'
    click_link @trail.name

    expect(page).to have_content @trail.name
    expect(page).to have_content @trail.description
    expect(page).to have_content @trail.location.geocode
    expect(page).to have_css "img[id*='map_#{@trail.id}']"
    expect(page).to have_css "a[href*='#{@trail.location.geocode}']"
  end

end
