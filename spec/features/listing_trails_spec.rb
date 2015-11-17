require "rails_helper"

RSpec.feature "Users can view trail listings" do
  before do
    #refactor this ugly code to be more Ruby...
    @trails = []
    @trail_1 = FactoryGirl.create(:trail)
    @trail_2 = FactoryGirl.create(:trail, name: "Circle Trail #332",
      description: "Circle Trail #332 rises and falls over the hilly terrain of Arizona’s central highlands.")
    @trails << @trail_1
    @trails << @trail_2
  end

  scenario "when visting the home page" do
    visit "/"
    #expect to include @trails when visting the home page as collection
    expect(page).to have_content "Trails in your area"
  end
end
