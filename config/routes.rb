Samistore::Application.routes.draw do
  devise_for :users
  resources :users

  resources :products

	get "search" => "search#index", :as => :search

  root :to => 'products#index'

  match 'products/:id/duplicate' => 'products#duplicate', :as => :duplicate
end
