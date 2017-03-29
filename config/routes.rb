Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "resturants#index"
  resources :resturants do
    resources :reviews, except: [:index, :show]
  end


  match '/about_us', to: 'pages#about_us',      via: :get
  match '/contact_us', to: 'pages#contact_us',  via: :get

end
