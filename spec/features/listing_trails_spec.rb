require "rails_helper"

RSpec.feature "Users can view trail listings" do
  scenario "when visting the home page" do
    visit "/"
    expect(page).to have_content "Trails in your area"
  end
end
