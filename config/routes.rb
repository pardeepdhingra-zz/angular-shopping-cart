Rails.application.routes.draw do
  
  devise_for :admins
  get 'admin' => "admin#dashboard", as: :admin_root
   
  namespace :admin do
  	resources :products
 end
  
  resources :products, only: [:index, :show]
  devise_for :users

  #root of the appplication
  root 'products#index'
end