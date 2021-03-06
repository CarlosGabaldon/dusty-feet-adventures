require 'rails_helper'

RSpec.feature "Users can delete tags from a trail" do
  let(:author) {create(:user, admin: true)}
  let(:trail) {create(:trail_with_tag_names, author: author)}

  before do
    login_as author
    visit trail_path(trail)
  end

  scenario "successfully", js: true do
    within find("div.tag", "tag_1") do
      click_link "remove"
    end
    expect(page).to_not have_content "tag_1"
  end
end
