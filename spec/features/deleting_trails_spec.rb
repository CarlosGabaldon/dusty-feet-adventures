require 'rails_helper'

RSpec.feature "Users can delete trails" do
  before do
    @trails = [create(:trail, name: "Trail 1"), create(:trail, name: "Trail 2")]
  end
  scenario "when clicking on delete trail" do
    visit "/"
    click_link @trails.first.name
    click_link "Edit Trail"
    click_button "Delete Trail"

    expect(page.current_url).to eq trails_url
  end
end
