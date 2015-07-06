require "rails_helper"

describe ProductsController do
  describe "#index" do
    it "shows only products of current user" do
      our_user = create(:user)
      foreign_user = create(:user)
      our_product = create(:product, user: our_user, name: "our product")
      foreign_product = create(
      :product, user: foreign_user, name: "foreign product")

      sign_in_as our_user
      get :index

      expect(assigns(:products).map(&:name)).to eq ["our product"]
    end
  end

  describe "#create" do
    it "creates product for current user" do
      user = create(:user)

      sign_in_as user
      post :create, product: { name: "Milk", quantity: "500" }

      expect(Product.last.user).to eq(user)
    end
  end
end
