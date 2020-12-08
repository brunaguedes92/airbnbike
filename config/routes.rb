Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :bikes, only: %i[index new show create] do
    collection do
      get :my_bikes
    end
  end

  resources :orders, only: %i[show create] do
    resources :payments, only: :new

    collection do
      get :my_orders
    end
  end

  mount StripeEvent::Engine, at: '/stripe-webhooks'
end
