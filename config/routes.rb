Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
  }

  root "items#index"

  resources :users, only: [:edit, :update] do
    member do
      get "mypage"
    end
  end
end
