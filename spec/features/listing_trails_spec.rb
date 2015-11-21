require "rails_helper"

RSpec.feature "Users can view trail listings" do
  before do
    @trails = [create(:trail_one), create(:trail_two)]
  end

  scenario "when visting the home page" do
    visit "/"
    expect(page).to have_content "Trails"
    expect(page).to have_selector "li", count: 2
  end
end
