Rails.application.routes.draw do
  devise_for :users
root to: "homes#top"
get 'home/about' => 'homes#about'

resources :users, only: [:edit, :update, :show, :index, :create]
resources :books, only: [:index, :new, :create, :show, :edit, :update]
get 'users' => 'users#index'
patch 'book/:id' => 'book#update', as: 'update_book'
delete 'books/:id' => 'books#destroy', as: 'destroy_book'

end
