Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
  }

  root "items#index"

  resources :users, only: [:edit, :update, :destroy] do
    member do
      get "mypage"
      get "leave"
    end
  end

  resources :shops, only: [:new, :create, :show] do
    member do
      get "admin"
    end
  end
end
