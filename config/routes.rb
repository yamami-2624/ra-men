Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#   Rails.application.routes.draw do
	devise_for :admin, controllers: {
    sessions: 'admin/sessions',
    passwords:     'admin/passwords',
    registrations: 'admin/registrations',
  }
  namespace :admin do
     # get 'top' => 'homes#top', as: 'top'
     # get 'search' => 'homes#search', as: 'search'
     # get 'customers/:customer_id/orders' => 'orders#index', as: 'customer_orders'
    resources :homes
    resources :raamens
    resources :reviews
    resources :shops
    resources :admins
    resources :genres
  end


  devise_for :users, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations',
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    resources :homes
    resources :raamens
    resources :reviews
    resources :shops
    resources :admins
    resources :genres
end

