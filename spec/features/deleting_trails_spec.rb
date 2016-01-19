require 'rails_helper'

RSpec.feature "Users can delete trails" do
  before do
    login_as create(:user, :admin)
    @trails = [create(:trail, name: "Trail 1"), create(:trail, name: "Trail 2")]
  end
  scenario "when clicking on delete trail" do
    visit edit_trail_path(@trails.first)
    click_link "Delete Trail"

    expect(page.current_url).to eq trails_url
    expect(page).to_not have_content "Trail 1"
  end
end
