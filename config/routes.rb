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
  get '/map_request', to: 'shops#map', as: 'map_request'
  devise_for :users, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations',
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    resources :genres
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


