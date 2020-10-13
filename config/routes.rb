Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#   Rails.application.routes.draw do
	devise_for :admin, controllers: {
    sessions: 'admin/sessions',
    passwords:     'admin/passwords',
  }
  devise_scope :admin do
    get '/admin/sign_out' => 'devise/sessions#destroy'
  end
  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
    resources :admins
    resources :homes
    resources :shops do
      resources :raamens do
        resources :reviews
      end
    end
  end

  get "shops/top" => "shops#top"
  root to: "shops#top"
  get "/weekly_ranking" , to: "shops#weekly_ranking" , as: "weekly_ranking"
  get "/monthly_ranking" , to: "shops#monthly_ranking" , as: "monthly_ranking"
  get "/year_ranking" , to: "shops#year_ranking" , as: "year_ranking"

  get "/weekly_tenranking" , to: "shops#weekly_tenranking" , as: "weekly_tenranking"
  get "/monthly_tenranking" , to: "shops#monthly_tenranking" , as: "monthly_tenranking"
  get "/year_tenranking" , to: "shops#year_tenranking" , as: "year_tenranking"

  get '/map_search', to: 'shops#map', as: 'map_search'
  get '/my_page', to: 'users#my_page', as: 'my_page'
  get '/about', to: 'homes#about', as: 'about'
  get '/search', to: 'shops#search', as: 'search'
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
      resource :favorites, only: [:create, :destroy]
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


