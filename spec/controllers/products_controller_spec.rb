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

  describe "#destroy" do
    it "deletes product" do
      user = create(:user)
      product = create(:product, user: user, name: "Milk")

      sign_in_as user
      expect { delete :destroy, id: product.id }.
        to change { user.products.count }.by(-1)
    end
  end

  describe "#update" do
    it "updates product" do
      user = create(:user)
      product = create(:product, user: user, name: "Milk")

      sign_in_as user

      expect { put :update, id: product.id, product: { 
        name: "Milkshake"} }.to change { product.reload.name }.to("Milkshake")
    end
  end
end
