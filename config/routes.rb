Rails.application.routes.draw do
  root to: "products#index"
  resources :products, only: [:new, :index, :create, :destroy, :edit, :update]
end
