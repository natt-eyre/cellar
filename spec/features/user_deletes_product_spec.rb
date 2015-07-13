require "rails_helper"

feature "User deletes a product" do
  scenario "succesfully" do
    user = create(:user)
    product = create(:product, user: user, name: "Milk")

    visit root_path(as: user)
    click_on "Delete"

    expect(page.current_path).to eq(products_path)
    expect(page).not_to have_content("Milk")
  end
end
