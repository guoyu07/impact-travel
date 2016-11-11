require "spec_helper"

feature "Polcy pages" do
  scenario "listing pages" do
    login_with_valid_credentials
    click_on "Policies"

    expect(page).to have_content("Terms & Policies")
  end

  scenario "terms of use page" do
    login_with_valid_credentials
    click_on "Terms of Use"

    expect(page).to have_content("Terms Of Use")
    expect(page).to have_content("Scope of our Service")
    expect(page).to have_content("Disclaimer of Warranties")
  end

  scenario "price guarantee page" do
    login_with_valid_credentials

    click_on "Terms of Use"
    click_on "Best Price Guarantee"

    expect(page).to have_content("Submitting a Claim")
    expect(page).to have_content("Best Price Guarantee")
  end
end
