require "rails_helper"

RSpec.feature "Users can sign up" do
  scenario "when providing valid details" do
    visit "/"
    click_link "Sign up"
    fill_in "Email", with: "carlos@parametertechnologies.com"
    fill_in "user_password", with: "password"
    fill_in "user_password_confirmation", with: "password"
    click_button "Sign up"
    expect(page).to have_content "Sign up Welcome! You have signed up successfully."
  end

  scenario "when providing invalid details" do
    visit "/"
    click_link "Sign up"
    fill_in "Email", with: "carlos@parametertechnologies.com"
    fill_in "user_password", with: "passwo"
    fill_in "user_password_confirmation", with: "password"
    click_button "Sign up"
    expect(page).to have_content "Password confirmation doesn't match Password"
  end

end
