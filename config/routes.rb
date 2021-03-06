Rails.application.routes.draw do
  root 'stores#index'
  
  devise_for :users
  resources  :users
  
  resources  :stores do
    resources :menus
    resources :products  	
  end

  get :events, to: 'menus#index'

  resources :carts, only: [:create]
  get :delete_cart, to: "carts#delete_cart"
  
  resources :orders, only: [:index, :create, :show, :destroy]
  get :recipient_adress, to: "orders#recipient_adress"
  post :pre_order, to: "orders#pre_order"
  
  namespace :admin do
    resources :stores, only: [:index, :show] do
      get :menu_info, to: 'monitorings#menu_info'
    end  
    get :orders_day, to: 'monitorings#orders_day'
    get :users, to: "monitorings#index"
    get :all_days, to: "monitorings#all_days"
    get :all_orders, to: "monitorings#all_orders"
    get :order, to: "monitorings#order"
    get :menus, to: 'monitorings#menus'
  end
end