require "rails_helper"

RSpec.feature "Users can view trail listings" do
  before do
    @trails = [create(:trail_one), create(:trail_two)]
  end

  scenario "when visting the home page" do
    visit "/"
    #expect to include @trails when visting the home page as collection
    expect(page).to have_content "Trails in your area"
  end
end
