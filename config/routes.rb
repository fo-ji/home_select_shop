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

  resources :shops, except:[:index] do
    resources :items, except:[:index, :show] do
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
    resources :communities, except:[:index, :show] do
      member do
        get "leave"
      end
    end
  end

  resources :communities, only: [:index, :show] do
    member do
      get "join"
    end
    resources :talks, only: [:index, :create]
    namespace :api do
      resources :talks, only: [:index], defaults: { format: "json" }
    end
    resources :recommends, only: [:index, :new, :create]
  end

  resources :items, only: [:show] do
    resources :item_payments, only: :create
  end
  
  resources :carts, only: [:show]

  post "/add_item"      => "carts#add_item"
  post "/update_item"   => "carts#update_item"
  delete "/delete_item" => "carts#delete_item"

  resources :credit_cards, only: [:new, :show] do
    collection do
      post "show",   to: "credit_cards#show"
      post "pay",    to: "credit_cards#pay"
      post "delete", to: "credit_cards#delete"
    end
  end
end
