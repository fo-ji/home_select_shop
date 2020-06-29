Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
  }

  root "home#top"

  resources :users, only: [:edit, :update, :destroy] do
    member do
      get "mypage"
      get "leave"
    end
    collection do 
      get "search"
    end
  end

  resources :shops, only: [:new, :create, :show, :edit, :update, :destroy] do
    member do
      get "admin"
      get "leave"
    end
  end
end
