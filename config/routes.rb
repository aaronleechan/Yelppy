Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "resturants#index"
  resources :resturants do
    resources :reviews, except: [:index, :show]
    collection do
      get 'search'
    end
  end

  match '/about_us', to: 'pages#about_us',      via: :get
  match '/contact_us', to: 'pages#contact_us',  via: :get
  #---#
  match '/add_favorites', to: 'users#add_to_favorites', via: :get
  match '/create_favorite', to: 'favorites#create', via: :get
  match '/profile', to: 'users#show_profile',   via: :get
end
