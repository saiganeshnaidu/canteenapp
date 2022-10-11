Rails.application.routes.draw do
  get 'rooms/index'
  root 'welcome#index'

  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create', as: 'log_in'
  delete 'logout', to: 'sessions#destroy'
  get 'password', to: 'passwords#edit', as: 'edit_password'
  patch 'password', to: 'passwords#update'
  get 'password/reset', to: 'password_resets#new'
  post 'password/reset', to: 'password_resets#create'
  get 'password/reset/edit', to: 'password_resets#edit'
  patch 'password/reset/edit', to: 'password_resets#update'
  get '/auth/:provider/callback', to: 'sessions#omniauth'
  get '/auth/facebook/callback', to: 'sessions#omniauth'

  resources :food_categories do
    resources :food_stores do
      resources :food_items
    end
  end

  get '/order_history', to: "employee_profiles#order_history"
  get '/order', to: "chef_profiles#order"
  get '/notice', to: "chef_profiles#notice"
  get 'chef_detail', to: 'chef_profiles#new'
  post 'chef_detail', to: 'chef_profiles#create'
  get 'employee_detail', to: 'employee_profiles#new'
  post 'employee_detail', to: 'employee_profiles#create'
  get 'customer_detail', to: 'customers#new'
  post 'customer_detail', to: 'customers#create'
  get '/noticee', to: "employee_profiles#noticee"
  get '/admin_notice', to: "welcome#admin_notice"
  get '/admin_dashboard', to: "welcome#admin_dashboard"
  get '/approvals', to: "welcome#approval"
  get '/customer_notice', to: "customers#customer_notice"

  resources :rooms do
    resources :messages
  end

  resources :employee_profiles, only: [:index, :show, :edit, :update]
  resources :chef_profiles, only: [:index, :show, :edit, :update]
  resources :customers, only: [:index, :show, :edit, :update]
  resources :carts
  get 'cartmsg', to: "cart_items#cartmsg"

  resources :cart_items
  resources :companies
  resources :registrations, only: [:edit, :update]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
