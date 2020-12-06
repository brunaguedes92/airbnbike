Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :bikes, only: %i[index new show create] do
    resources :rents, only: %i[new create show]
  end
  resources :orders, only: %i[show create] do
    resources :payments, only: :new
  end
end
