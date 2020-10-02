Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#   Rails.application.routes.draw do
	devise_for :admin, controllers: {
    sessions: 'admin/sessions',
    passwords:     'admin/passwords',
    registrations: 'admin/registrations',
  }
  
  namespace :admin do
    resources :admins
    resources :genres
    resources :homes
    resources :shops do
      resources :raamens do
        resources :reviews
      end
    end
  end

  get "shops/top" => "shops#top"
  get "/ranking" , to: "shops#ranking" , as: "ranking"
  get '/map_request', to: 'shops#map', as: 'map_request'
  get '/my_page', to: 'users#my_page', as: 'my_page'
  get '/search', to: 'shops#search', as: 'search'
  delete "/favorites", to: "shops/favorites#destroy"
  post "/favorites", to: "shops/favorites#create"
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    resources :homes
    resources :shops do
      member do
        get "search"
      end
      resources :raamens do
        member do
        get "search"
      end
        resources :reviews
      end
    end
    get '/admin/raamens' => 'admin/raamens#index'
  end


