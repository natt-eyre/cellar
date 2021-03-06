require "rails_helper"

feature "User adds a product" do
  scenario "successfully" do
    visit root_path(as: create(:user))
    click_on t("products.index.add")
    fill_in Product.human_attribute_name("name"), with: "Milk"
    fill_in Product.human_attribute_name("quantity"), with: "2"
    select_date(Date.today + 1.day, from: "product_expiry_date")
    click_on t("products.new.add")

    expect(page.current_path).to eq(products_path)
    expect(page).to have_content("Milk")
  end

  def select_date(date, options = {})
    field = options[:from]
    select date.year, :from => "#{field}_1i" #year
    select date.strftime('%B'), :from => "#{field}_2i" #month
    select date.day, :from => "#{field}_3i" #day
  end

end
