Rails.application.routes.draw do
  get 'credit_cards/new'
  get 'credit_cards/show'
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
    resources :items, only: [:new, :create, :edit, :update, :destroy] do
      collection do
        get "search_child", defaults: { format: "json" }
      end
      member do
        get "search_child", defaults: { format: "json" }
      end
    end
    member do
      get "admin"
      get "admin_index"
      get "leave"
    end
  end

  resources :items, only: :show

  resources :carts, only: [:show]

  post '/add_item' => 'carts#add_item'
  post '/update_item' => 'carts#update_item'
  delete '/delete_item' => 'carts#delete_item'

  resources :credit_card, only: [:new, :show] do
    collection do
      post "show", to: "card#show"
      post "pay", to: "card#pay"
      post "delete", to: "card#delete"
    end
  end
end
