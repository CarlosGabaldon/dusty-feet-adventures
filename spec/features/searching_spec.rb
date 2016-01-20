require 'rails_helper'

RSpec.feature "Users can search for trails matching specific criteria" do
  before do
    @trails = [create(:trail_two, name: "Trail 1", tag_names: "tag_1"),
      create(:trail_two, name: "Trail 2", tag_names: "tag_2")]
    visit "/"
  end

  scenario "searching by tag" do
    fill_in "Search", with: "tag_1"
    click_button "Search"
    within("#trails") do
      expect(page).to have_link @trails.first.name
      expect(page).to_not have_link @trails.last.name
    end
  end

end
