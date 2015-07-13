require "rails_helper"

feature "User edits a product" do
  scenario "successfully" do
    user = create(:user)
    product = create(:product, user: user, name: "Milk")

    visit root_path(as: user)
    click_on "Edit"
    expect(page.current_path).to eq(edit_product_path(product))

    fill_in Product.human_attribute_name("name"), with: "Milkshake"
    click_on "Save changes"

    expect(page.current_path).to eq(products_path)
    expect(page).to have_content("Milkshake")
  end
end
